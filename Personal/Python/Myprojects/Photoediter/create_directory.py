import os

# get path varables to get imgs and send imgs
pathIn = os.path.join(os.path.expanduser(
    '~'), 'Documents', 'pyPhotoeditor', 'Input')
pathOut = os.path.join(os.path.expanduser(
    '~'), 'Documents', 'pyPhotoeditor', 'Output')

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