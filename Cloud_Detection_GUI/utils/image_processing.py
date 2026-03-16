import numpy as np

def generate_dummy_data(size=1024):
    return np.random.rand(size).astype(np.float32).tolist()

def load_image_data(image_path):
    return generate_dummy_data()
