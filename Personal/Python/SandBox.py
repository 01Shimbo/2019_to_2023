'''
using os.path.join is much more consistant than using double \\
    
'''
import os 
path = os.path.join ('C:','Users', 'Shane', 'OneDrive', 'Pictures', 'Saved Pictures')
# isExist = os.path.exists(path)
print(path)
newpath = os.path.join (path, 'editedLylaSecret')
os.makedirs(newpath)
newisExist = os.path.exists(newpath)
print(newisExist)

