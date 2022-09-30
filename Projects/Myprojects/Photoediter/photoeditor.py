from importlib.resources import path
from PIL import Image, ImageEnhance, ImageFilter
import os

path = 'C:\\Users\\Shane\\OneDrive\\Pictures\\Saved Pictures\\.LylaSecret'
os.mkdir('C:\\Users\\Shane\\OneDrive\\Pictures\\Saved Pictures\\.editedLylaSecret')
pathOut = 'C:\\Users\\Shane\\OneDrive\\Pictures\\Saved Pictures\\.editedLylaSecret'

for filename in os.listdir(path):
    img = Image.open(f"{path}/{filename}")

    edit = img.filter(ImageFilter.SHARPEN)
    
    clean_name = os.path.splitext(filename)[0]
print(os.path)