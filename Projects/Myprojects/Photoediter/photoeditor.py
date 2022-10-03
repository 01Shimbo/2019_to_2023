from importlib.resources import path
from PIL import Image, ImageEnhance, ImageFilter
import os

      
pathIn  = os.path.join (os.path.expanduser('~'), 'Documents', 'pyPhotoeditor', 'Input')
pathOut  = os.path.join (os.path.expanduser('~'), 'Documents', 'pyPhotoeditor', 'Output')

pathInExist = os.path.exists(pathIn)
if pathInExist == False:
    os.makedirs(pathIn)
    print(f'New path created: {pathIn}')

pathOutExist = os.path.exists(pathOut)
if pathOutExist == False:
    os.makedirs(pathOut)
    print(f'New path created: {pathOut}')

# for filename in os.listdir(pathIn):
#     img = Image.open(f"{pathIn}/{filename}")

#     edit = img.filter(ImageFilter.SHARPEN)
    
#     clean_name = os.path.splitext(filename)[0]
# print(os.path)