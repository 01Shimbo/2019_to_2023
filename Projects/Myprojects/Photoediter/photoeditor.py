from importlib.resources import path
from PIL import Image, ImageEnhance, ImageFilter
import os
        ('C:','Users', 'Shane', 'OneDrive', 'Pictures', 'Saved Pictures')
pathIn = os.path.join ('C:\\Users\\Shane\\OneDrive\\Pictures\\Saved Pictures\\Input'
)
os.mkdir('C:\\Users\\Shane\\OneDrive\\Pictures\\Saved Pictures\\Output')
pathOut = 'C:\\Users\\Shane\\OneDrive\\Pictures\\Saved Pictures\\Output'

for filename in os.listdir(pathIn):
    img = Image.open(f"{pathIn}/{filename}")

    edit = img.filter(ImageFilter.SHARPEN)
    
    clean_name = os.path.splitext(filename)[0]
print(os.path)