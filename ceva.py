import heapq
from matplotlib import patches
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import figure
from pymongo import MongoClient, DESCENDING
import os
from gridfs import GridFS
from urllib.request import urlopen
import math
from matplotlib.pyplot import arrow
from matplotlib import animation

myclient = MongoClient("mongodb+srv://andreinapruiu:xLOLaVRwqWOA2DUt@cluster0.dw2sytn.mongodb.net/test")
mydb = myclient["smarket-api-db"]
mycol = mydb["product"]
myshoppingList = mydb["shoppingList"]


grid = np.array([
    [0, 0, 0, 0, 0, 1, 2, 3, 4, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 4, 3, 2, 1, 4, 0, 0, 4, 4, 0, 0, 4, 4, 0],
    [0, 0, 0, 0, 0, 3, 0, 0, 3, 3, 0, 0, 3, 3, 0],
    [0, 0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 0, 2, 2, 0],
    [0, 4, 3, 2, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 4, 3, 2, 1, 0, 0, 0, 0, 0, 1, 2, 3, 4, 0],
    [0, 4, 3, 2, 1, 0, 0, 0, 0, 0, 1, 2, 3, 4, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 4, 3, 2, 1, 0, 0, 0, 0, 0, 1, 2, 3, 4, 0],
    [0, 4, 3, 2, 1, 0, 0, 0, 0, 0, 1, 2, 3, 4, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ])

# start point and goal
start = (14, 7)
goal = (0, 14)

# def line_intersects(a1, a2, b1, b2):
#     def ccw(a, b, c):
#         return (c[1]-a[1])*(b[0]-a[0]) > (b[1]-a[1])*(c[0]-a[0])

#     # Check if line segments a1-a2 and b1-b2 intersect
#     if ccw(a1, b1, b2) != ccw(a2, b1, b2) and ccw(a1, a2, b1) != ccw(a1, a2, b2):
#         # Check if the line segment intersects with any non-zero positions in the grid
#         for i in range(min(a1[0], a2[0]), max(a1[0], a2[0]) + 1):
#             for j in range(min(a1[1], a2[1]), max(a1[1], a2[1]) + 1):
#                 if grid[i][j] != 0 and ccw((i,j), b1, b2) != ccw((i,j), a2, a1):
#                     return True
#         return False
#     else:
#         return False

def euclidean_distance(a, b):
    return math.sqrt((a[0]-b[0])**2 + (a[1]-b[1])**2)

def find_path(nodes, start, end, product_names):
    # Initialize path with start node
    path = [start]

    # Initialize set of unvisited nodes
    unvisited = set(nodes)

    # Repeat until all nodes have been visited
    while unvisited:
        # Find the nearest unvisited node to the current node
        current_node = path[-1]
        nearest_node = min(unvisited, key=lambda node: euclidean_distance(current_node, node))

        # Add the nearest node to the path and remove it from the set of unvisited nodes
        path.append(nearest_node)
        unvisited.remove(nearest_node)

    # Add end node to path
    path.append(end)

    # Sort product names based on the order of the nodes in the path
    sorted_product_names = [product_names[nodes.index(node)] for node in path if node in nodes]

    return path, sorted_product_names

last_document = myshoppingList.find_one(sort=[('_id', DESCENDING)])
productList = last_document['productList']

product_names = []

for product in productList:
	product_document = mydb.dereference(product)
	product_names.append(product_document['name'])

max_row = 15
max_column = 4
min_column = 1
coordinates = []
for product in productList:
	product_document = mydb.dereference(product)
	row = product_document['row']
	shelve = product_document['shelve']
	section = product_document['section']
	if row == 11:
		start_row = 5
		start_section = 6
                
		coordinates.append((start_row - section, start_section))
	elif row == 16:
		start_row = 5
		start_section = 7
		
		coordinates.append((start_row - section, start_section))
	elif row == 14:
		start_row = 5
		start_section = 10
                
		coordinates.append((start_row - section, start_section))
	elif row == 12:
		start_row = 5
		start_section = 11
                
		coordinates.append((start_row - section, start_section))
	elif row == 10:
		start_row = 5
		start_section = 14
                
		coordinates.append((start_row - section, start_section))
	elif row == 1 or row == 5 or row == 9:
		start_section = 1
		coordinates.append((max_row - row, max_column - section + start_section))
	elif row == 3 or row == 7 or row == 13:
		start_section = 1
		coordinates.append((max_row - row - 1, max_column - section + start_section))
	elif row == 15:
		start_section = 5
		coordinates.append((max_row - row + 1, start_section + section - min_column))
	elif row == 2 or row == 6:
		start_section = 10
		coordinates.append((max_row - row + 1, start_section + section - min_column))
	elif row == 4 or row == 8:
		start_section = 10
		coordinates.append((max_row - row, start_section + section - min_column))
    
print(coordinates)
print(product_names)

# Find the paths between the nodes
nodes = [(10, 4), (7, 10), (12, 5), (6, 3), (5, 7), (4, 11), (10, 0), (2, 11), (8, 0)]
nodes = coordinates
path, new_product_names = find_path(nodes, start, goal, product_names=product_names)

# Print the paths
print(path)
print(new_product_names)

# Add the new product names to the database
mysortedshoppingList = mydb["sortedShoppingList"]
mysortedshoppingList.insert_one({'productList': new_product_names})

# Extract x and y coordinates from the path list
x_coords = []
y_coords = []

# for path in paths:
for point in path:
	x_coords.append(point[0])
	y_coords.append(point[1])

# Plot map and path
fig, ax = plt.subplots(figsize=(20, 20))
colors = ['#FFFFFF', '#E2EAEF', '#E2EAEF', '#E2EAEF', '#E2EAEF']
cmap = matplotlib.colors.ListedColormap(colors)

# Create a boundary around each non-zero square
for i in range(grid.shape[0]):
    for j in range(grid.shape[1]):
        if grid[i, j] == 0:
            rect = plt.Rectangle((j - 0.5 + 0.5 * grid[i,j], i - 0.5 + 0.5 * grid[i,j]), 1, 1, fill=False, edgecolor='#EAECEE', lw=2)
            ax.add_patch(rect)
            ax.plot([j - 0.5, j + 0.5], [i, i], color='#EAECEE')
            ax.plot([j, j], [i - 0.5, i + 0.5], color='#EAECEE')

for i in range(grid.shape[0]):
    for j in range(grid.shape[1]):
        if grid[i, j] != 0:
            text = str(grid[i, j])
            ax.text(j, i, text, color='black', ha='center', va='center', fontsize=50, fontweight='bold')
            rect = plt.Rectangle((j - 0.5, i - 0.5), 1, 1, fill=False, edgecolor='black', lw=2)
            ax.add_patch(rect)

# Plot the grid with the specified color scheme
ax.imshow(grid, cmap=cmap)

# Plot the nodes
for node in nodes:
    ax.scatter(node[1], node[0], marker="o", color="#88B6A5", s=2000, zorder=10)
    
# Put numbers on the nodes from the path
for i in range(len(path)):
    ax.text(path[i][1], path[i][0], str(i), color="black", fontsize=25, ha="center", va="center", fontweight='bold', zorder=20)

# Plot the start and goal points
ax.scatter(start[1], start[0], marker="o", color="#F56457", s=2000, zorder=10)
ax.scatter(goal[1], goal[0], marker="o", color="green", s=2000, zorder=10)

# Plot the path
ax.plot(y_coords, x_coords, color="#6979B2", linewidth=5)

from io import BytesIO

fs = GridFS(mydb)

# Define the arrow object outside of the loop
for i in range(len(path) - 1):
    arrow1 = arrow(path[i][1], path[i][0], path[i+1][1] - path[i][1], path[i+1][0] - path[i][0], width=0.1, color='#F56457', zorder=11)
    filename = 'file' + str(i) + '.png'
    img_data = BytesIO()
    plt.savefig(img_data, format='png')
    img_data.seek(0)
    fs.put(img_data, filename=filename)
    arrow1.set_visible(False)


plt.savefig('file.png')