from importlib.resources import path
from PIL import Image, ImageEnhance, ImageFilter, ImageColor
import os

# get path varables to get imgs and send imgs   
pathIn  = os.path.join (os.path.expanduser('~'), 'Documents', 'pyPhotoeditor', 'Input')
pathOut  = os.path.join (os.path.expanduser('~'), 'Documents', 'pyPhotoeditor', 'Output')

# create path for data in
pathInExist = os.path.exists(pathIn)
if pathInExist == False:
    os.makedirs(pathIn)
    print(f'New path created: {pathIn}')

# create path for data out
pathOutExist = os.path.exists(pathOut)
if pathOutExist == False:
    os.makedirs(pathOut)
    print(f'New path created: {pathOut}')

# List all the files in the pathin dir
count = 0
for path in os.listdir(pathIn):
    # os.path.isfile returns T/F. if true create path to image
    if os.path.isfile(os.path.join(pathIn, path)):
        # if true increase count
        count += 1
        # print path
        # print(os.path.join(pathIn, path))
        # opens img
        img = Image.open(f"{pathIn}/{path}")
        edit = img.Image.
        edit.save(f"{pathOut}/{path}")
# print(os.path)
print("completed")