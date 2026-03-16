import struct
import serial
import time
from PyQt6.QtCore import QThread, pyqtSignal

class SerialWorker(QThread):
    log_signal = pyqtSignal(str)              
    result_signal = pyqtSignal(float, float)  
    finished_signal = pyqtSignal()            

    def __init__(self, port, baudrate=115200, timeout=1.0):
        super().__init__()
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.data_to_send = None  
        self.is_running = True

    def set_data(self, data):
        self.data_to_send = data

    def run(self):
        ser = None
        try:
            self.log_signal.emit(f"[INFO] Connecting to {self.port}...")
            ser = serial.Serial(self.port, self.baudrate, timeout=self.timeout)
            
            if not ser.is_open:
                self.log_signal.emit(f"[ERROR] Failed to open {self.port}")
                return

            self.log_signal.emit(f"[INFO] Connected. Waiting for 'READY'...")

            start_time = time.time()
            received_ready = False
            
            while time.time() - start_time < 5.0:  
                if self.isInterruptionRequested():
                    return
                
                line = ser.readline().decode('utf-8', errors='ignore').strip()
                if "READY" in line:
                    received_ready = True
                    self.log_signal.emit("[INFO] Received 'READY' from FPGA.")
                    break
            
            if not received_ready:
                self.log_signal.emit("[ERROR] Timeout waiting for 'READY'.")
                return

            if self.data_to_send is not None:
                self.log_signal.emit(f"[INFO] Sending {len(self.data_to_send)} floats...")
                packed_data = struct.pack(f'<{len(self.data_to_send)}f', *self.data_to_send)
                ser.write(packed_data)
                ser.flush()
                self.log_signal.emit("[INFO] Data sent successfully.")
            else:
                self.log_signal.emit("[ERROR] No data to send.")
                return

            self.log_signal.emit("[INFO] Waiting for results...")
            result_data = ser.read(8) 
            
            if len(result_data) == 8:
                cloud_prob, sky_prob = struct.unpack('<2f', result_data)
                self.log_signal.emit(f"[RESULT] Cloud: {cloud_prob*100:.2f}%, Sky: {sky_prob*100:.2f}%")
                self.result_signal.emit(cloud_prob, sky_prob)
            else:
                self.log_signal.emit(f"[ERROR] Incomplete data received: {len(result_data)} bytes")

        except serial.SerialException as e:
            self.log_signal.emit(f"[CS-ERROR] Serial Exception: {str(e)}")
        except Exception as e:
            self.log_signal.emit(f"[GEN-ERROR] Unexpected error: {str(e)}")
        finally:
            if ser and ser.is_open:
                ser.close()
                self.log_signal.emit("[INFO] Connection closed.")
            self.finished_signal.emit()

    def stop(self):
        self.requestInterruption()
        self.wait()
