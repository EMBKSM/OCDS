import sys
from PyQt6.QtWidgets import QApplication, QMessageBox
import numpy as np
import os

current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_dir)

from ui.main_window import MainWindow
from core.serial_worker import SerialWorker
from utils.image_processing import generate_dummy_data

class CloudDetectionApp(MainWindow):
    def __init__(self):
        super().__init__()
        
        self.is_connected = False
        self.worker = None
        self.selected_port = None
        
        self.btn_connect.clicked.connect(self.toggle_connection)
        self.btn_start.clicked.connect(self.start_test)
        
        self.update_ui_state()

    def update_ui_state(self):
        if self.is_connected:
            self.btn_connect.setText("Disconnect")
            self.combo_ports.setEnabled(False)
            self.btn_refresh.setEnabled(False)
            self.btn_start.setEnabled(True)
            self.append_log(f"[SYSTEM] Port {self.selected_port} locked.")
        else:
            self.btn_connect.setText("Connect")
            self.combo_ports.setEnabled(True)
            self.btn_refresh.setEnabled(True)
            self.btn_start.setEnabled(False)
            self.append_log("[SYSTEM] Disconnected.")

    def toggle_connection(self):
        if self.is_connected:
            self.is_connected = False
            self.selected_port = None
            self.update_ui_state()
        else:
            port = self.combo_ports.currentText()
            if not port or port == "No Ports":
                QMessageBox.critical(self, "Error", "No valid COM port selected.")
                self.btn_connect.setChecked(False) 
                return
            
            self.selected_port = port
            self.is_connected = True
            self.update_ui_state()

    def start_test(self):
        if not self.is_connected or not self.selected_port:
            QMessageBox.warning(self, "Warning", "Please connect to a serial port first.")
            return

        self.btn_start.setEnabled(False) 
        self.append_log("[SYSTEM] Generating test data...")
        
        try:
            data = generate_dummy_data(1024)
            
            self.worker = SerialWorker(self.selected_port)
            self.worker.set_data(data)
            
            self.worker.log_signal.connect(self.append_log)
            self.worker.result_signal.connect(self.handle_result)
            self.worker.finished_signal.connect(self.on_worker_finished)
            
            self.worker.start()
            
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to start test: {str(e)}")
            self.btn_start.setEnabled(True)

    def handle_result(self, cloud_prob, sky_prob):
        self.pbar_cloud.setValue(int(cloud_prob * 100))
        self.pbar_sky.setValue(int(sky_prob * 100))
        
        self.lbl_cloud_val.setText(f"{cloud_prob*100:.1f}%")
        self.lbl_sky_val.setText(f"{sky_prob*100:.1f}%")
        
        if cloud_prob > 0.5:
            self.lbl_cloud_val.setStyleSheet("font-size: 18px; font-weight: bold; color: red;")
        else:
            self.lbl_cloud_val.setStyleSheet("font-size: 18px; font-weight: bold; color: #2980b9;")

    def on_worker_finished(self):
        self.btn_start.setEnabled(True)
        self.worker = None

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = CloudDetectionApp()
    window.show()
    sys.exit(app.exec())
