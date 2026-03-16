from PyQt6.QtWidgets import (
    QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, 
    QComboBox, QPushButton, QTextEdit, QLabel, 
    QProgressBar, QGroupBox, QGridLayout, QSizePolicy
)
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QFont, QPixmap, QColor
import serial.tools.list_ports

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Cloud Detection FPGA Controller")
        self.resize(1000, 700)
        
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QHBoxLayout(central_widget)

        left_panel = QWidget()
        left_layout = QVBoxLayout(left_panel)
        left_panel.setFixedWidth(350)  

        conn_group = QGroupBox("Connection Settings")
        conn_layout = QGridLayout()
        
        self.combo_ports = QComboBox()
        self.btn_refresh = QPushButton("Refresh")
        self.btn_connect = QPushButton("Connect")
        self.btn_connect.setCheckable(True)  
        
        conn_layout.addWidget(QLabel("COM Port:"), 0, 0)
        conn_layout.addWidget(self.combo_ports, 0, 1)
        conn_layout.addWidget(self.btn_refresh, 0, 2)
        conn_layout.addWidget(self.btn_connect, 1, 0, 1, 3)
        
        conn_group.setLayout(conn_layout)
        left_layout.addWidget(conn_group)

        ctrl_group = QGroupBox("Operation")
        ctrl_layout = QVBoxLayout()
        
        self.btn_start = QPushButton("Start Test")
        self.btn_start.setMinimumHeight(40)
        self.btn_start.setStyleSheet("font-weight: bold; font-size: 14px;")
        
        ctrl_layout.addWidget(self.btn_start)
        ctrl_group.setLayout(ctrl_layout)
        left_layout.addWidget(ctrl_group)

        log_group = QGroupBox("System Log")
        log_layout = QVBoxLayout()
        
        self.text_log = QTextEdit()
        self.text_log.setReadOnly(True)
        self.text_log.setStyleSheet("background-color: black; color: #00FF00; font-family: Consolas;")
        
        log_layout.addWidget(self.text_log)
        log_group.setLayout(log_layout)
        left_layout.addWidget(log_group)
        
        main_layout.addWidget(left_panel)

        right_panel = QWidget()
        right_layout = QVBoxLayout(right_panel)

        self.lbl_image = QLabel("No Image Loaded")
        self.lbl_image.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.lbl_image.setStyleSheet("border: 2px dashed gray; background-color: #f0f0f0;")
        self.lbl_image.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)
        
        right_layout.addWidget(self.lbl_image, stretch=3) 

        result_group = QGroupBox("Detection Results")
        result_layout = QGridLayout()
        
        self.lbl_cloud_text = QLabel("Cloud Probability:")
        self.pbar_cloud = QProgressBar()
        self.pbar_cloud.setRange(0, 100)
        self.pbar_cloud.setStyleSheet("QProgressBar::chunk { background-color: #3498db; }")
        self.lbl_cloud_val = QLabel("0.0%")
        self.lbl_cloud_val.setStyleSheet("font-size: 18px; font-weight: bold; color: #2980b9;")
        
        self.lbl_sky_text = QLabel("Sky Probability:")
        self.pbar_sky = QProgressBar()
        self.pbar_sky.setRange(0, 100)
        self.pbar_sky.setStyleSheet("QProgressBar::chunk { background-color: #e67e22; }")
        self.lbl_sky_val = QLabel("0.0%")
        self.lbl_sky_val.setStyleSheet("font-size: 18px; font-weight: bold; color: #d35400;")

        result_layout.addWidget(self.lbl_cloud_text, 0, 0)
        result_layout.addWidget(self.pbar_cloud, 0, 1)
        result_layout.addWidget(self.lbl_cloud_val, 0, 2)
        
        result_layout.addWidget(self.lbl_sky_text, 1, 0)
        result_layout.addWidget(self.pbar_sky, 1, 1)
        result_layout.addWidget(self.lbl_sky_val, 1, 2)
        
        result_group.setLayout(result_layout)
        right_layout.addWidget(result_group, stretch=1)

        main_layout.addWidget(right_panel)

        self.refresh_ports()
        self.btn_refresh.clicked.connect(self.refresh_ports)

    def refresh_ports(self):
        self.combo_ports.clear()
        ports = serial.tools.list_ports.comports()
        for p in ports:
            self.combo_ports.addItem(f"{p.device}")
        
        if not ports:
            self.combo_ports.addItem("No Ports")

    def append_log(self, message):
        self.text_log.append(message)
        cursor = self.text_log.textCursor()
        cursor.movePosition(cursor.MoveOperation.End)
        self.text_log.setTextCursor(cursor)
