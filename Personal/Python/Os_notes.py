'''
using os.path.join is much more consistant than 
using double backslash puls works accross differnt OS
    
'''
import os 
path = os.path.join ('C:','Users', 'Shane', 'OneDrive', 'Pictures', 'Saved Pictures')
# isExist = os.path.exists(path)
# print(path)
newpath = os.path.join (path, 'editedLylaSecret')
# os.makedirs(newpath)
newisExist = os.path.exists(newpath)
# print(newisExist)

'''
using os.path.expanduser('~') will get users home dir
'''
# usrpath = os.path.expanduser('~')
docpath = os.path.join (os.path.expanduser('~'), 'Documents')
docpathExist = os.path.exists(docpath)
print (docpathExist)
print(docpath)

