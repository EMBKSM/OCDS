import sys
import os

print("Verifying imports...")

try:
    import PyQt6
    import serial
    import numpy
    print("[PASS] Libraries installed.")
except ImportError as e:
    print(f"[FAIL] Missing library: {e}")

try:
    sys.path.append(os.getcwd())
    from core.serial_worker import SerialWorker
    from ui.main_window import MainWindow
    from utils.image_processing import generate_dummy_data
    print("[PASS] Project modules imported.")
except Exception as e:
    print(f"[FAIL] Project import error: {e}")
    import traceback
    traceback.print_exc()

print("Verification complete.")
