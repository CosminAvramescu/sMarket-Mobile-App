from pymongo import MongoClient
from gridfs import GridFS
import os

myclient = MongoClient("mongodb+srv://andreinapruiu:xLOLaVRwqWOA2DUt@cluster0.dw2sytn.mongodb.net/test")
mydb = myclient["smarket-api-db"]
fs = GridFS(mydb)

#download all the files from the database

for file in fs.find():
	with open(file.filename, "wb") as f:
		f.write(file.read())
    

filename = "file"
file_id = fs.find_one({"filename": filename})._id
file = fs.get(file_id)

# Specify the path to save the file
path_to_save = "./" + filename + ".png"

with open(path_to_save, "wb") as f:
    f.write(file.read())

print(f"File {filename} was downloaded successfully at {os.path.abspath(path_to_save)}")