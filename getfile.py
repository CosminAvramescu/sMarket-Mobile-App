from pymongo import MongoClient
from gridfs import GridFS
import os

myclient = MongoClient("mongodb+srv://andreinapruiu:xLOLaVRwqWOA2DUt@cluster0.dw2sytn.mongodb.net/test")
mydb = myclient["smarket-api-db"]
fs = GridFS(mydb)

# Get a list of all the files in the database
files = fs.find()

# Iterate over the files and download each one
for file in files:
    filename = file.filename
    file_id = file._id
    file = fs.get(file_id)

    # Specify the path to save the file
    path_to_save = "./" + filename

    with open(path_to_save, "wb") as f:
        f.write(file.read())

    print(f"File {filename} was downloaded successfully at {os.path.abspath(path_to_save)}")
    
    fs.delete(file_id)
    print(f"File {filename} was deleted from the database")
