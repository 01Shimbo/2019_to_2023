from PIL import Image, ImageFile
import os
ImageFile.LOAD_TRUNCATED_IMAGES = True


def main():
    pathIn = os.path.join(os.path.expanduser(
        '~'), 'Documents', 'pyPhotoeditor', 'Input')
    pathOut = os.path.join(os.path.expanduser(
        '~'), 'Documents', 'pyPhotoeditor', 'Output')
    
    # all the code could be wiriten in a single function but I wanted to practice segmenting my code
    img_path_dict = get_images_path(pathIn)
    image_to_pdf(img_path_dict, pathOut)


def get_images_path(pathIn):
    """
    Summary:
    Get images path from the imput folder created by the create_directory.py
    the paths will be copyed and stored in a dictionary. 
    unfortunately this saves each path in a list only containing that one path I would like to
    fix this either storing it in a large list or muliable strings


    the file structure should be:
        Input -> folder_1 -> image_1
                             image_2
                             ...
                 folder_2 -> image_50
                             image_51
                             ...               

    Input:
        pathIn (filepath): path of the folder containing the images.

    Output:
        img_dict: {'folder_1': [image_path_1], [image_path_2], ... 'folder_2': [image_path_50], [image_path_51], ...}  
    """
    img_dict = {}
    for dir_path in (os.listdir(pathIn)):
        for img_path in os.listdir(f"{pathIn}\\{dir_path}"):
            absolute_path = f"{pathIn}\\{dir_path}\\{img_path}"
            if img_dict.get(f'{dir_path}') is not None:
                img_dict.setdefault(f'{dir_path}', []).append([absolute_path])
            else:
                img_dict[f'{dir_path}'] = ([[absolute_path]])
    return img_dict


def image_to_pdf(img_path_dict, pathOut):
    """
    Summary:
        Takes dictionary of image paths
        converts image to RGB
        appends image to a list
        write the completed pdf
         returns pdf file named Book_<folder_of_folder>.pdf

    Inputs:
        img_path_dict: dictionary -> {'folder_1': [image_path_1], [image_path_2], ... 'folder_2': [image_path_50], [image_path_51], ...}
        pathOut: filepath where pdf will be created

    Outputs:
        writes a pdf file to the output directory
    """

    for key in img_path_dict.keys():
        img_open_list = []
        for img_path in img_path_dict[key]:
            img_path = img_path[0]
            dir_path = key
            print(img_path)
            img = Image.open(img_path)
            img.convert('RGB')
            if img.mode == 'RGBA':
                img = img.convert('RGB')
            elif img.mode == 'LA':
                img = img.convert('RGB')
            img_open_list.append(img)
            img_open_list[0].save(
                f"{pathOut}/Book_{dir_path}.pdf", save_all=True, append_images=img_open_list)
        print(f"Created: {pathOut}/vol_{key}.pdf")


if __name__ == '__main__':
    main()
    print("completed")
