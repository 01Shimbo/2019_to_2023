from importlib.resources import path
from PIL import Image
import os
import numpy as np
# this photoscript creates a black and white photo then makes the white background transparent leaving a black image

# get path varables to get imgs and send imgs
pathIn = os.path.join(os.path.expanduser(
    '~'), 'Documents', 'pyPhotoeditor', 'Input')
pathOut = os.path.join(os.path.expanduser(
    '~'), 'Documents', 'pyPhotoeditor', 'Output')

# edit threshold tell black outline is wanted
threshold = 90

# loops through pixel data to make white transparent
def remove_white(img):
    """ Summary: Efficient way to change white pixels using numpy 

    Returns:
        image: white pixels are transparent
    """
    blackAndWhiteRGBA = img.convert('RGBA')
    newImage = []
    for item in blackAndWhiteRGBA.getdata():
        # matches each pixel that is white
        if item[:3] == (255, 255, 255):
            # change the pixel to be opacity to 0
            newImage.append((255, 255, 255, 0))
        else:
            # Array.append(value) adds to the end of the array
            newImage.append(item)
        # putdata is a PIL method Image.putdata(data, scale=1.0, offset=0.0)
        # Copies pixel data to this image. This method copies data from a sequence object into the image
    blackImage = blackAndWhiteRGBA.putdata(newImage)
    return blackImage



def numpy_remove_white(img):
    # create array of imput image
    # copy array because image is out of function
    img = np.asarray(img.convert('RGBA')).copy()
    # ignore the x,y value and only adjust the 4th vaule 'A'
    # if RGB == 255 (white) make 'A' transparent
    img[:, :, 3] = (255 * (img[:, :, :3] != 255).any(axis=2)).astype(np.uint8)
    return Image.fromarray(img)


# List all the files in the pathin dir
for path in os.listdir(pathIn):
    # open image
    img = Image.open(f"{pathIn}/{path}")

    # edit image grayscale
    grayscale = img.convert('L')
    blackAndWhite = grayscale.point(
        # short hand way of making a value that is above or below
        # threshold a 255 or 0 depending on which side of the threshold
        lambda x: 255 if x > threshold else 0
    )
    # removed because it takes too long
    # blackImage = remove_white(blackAndWhite)
    # call remove_white function
    blackImage = numpy_remove_white(blackAndWhite)

    blackImage.save(f"{pathOut}/{path}", "PNG")
# save data to pathOut


print("completed")
