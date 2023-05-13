import heapq
from matplotlib import patches
import matplotlib
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import figure
from pymongo import MongoClient
import os
from gridfs import GridFS
from urllib.request import urlopen
import math
from matplotlib.pyplot import arrow
from matplotlib import animation

myclient = MongoClient("mongodb+srv://andreinapruiu:xLOLaVRwqWOA2DUt@cluster0.dw2sytn.mongodb.net/test")
mydb = myclient["smarket-api-db"]
mycol = mydb["product"]


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

def line_intersects(a1, a2, b1, b2):
    def ccw(a, b, c):
        return (c[1]-a[1])*(b[0]-a[0]) > (b[1]-a[1])*(c[0]-a[0])

    # Check if line segments a1-a2 and b1-b2 intersect
    if ccw(a1, b1, b2) != ccw(a2, b1, b2) and ccw(a1, a2, b1) != ccw(a1, a2, b2):
        # Check if the line segment intersects with any non-zero positions in the grid
        for i in range(min(a1[0], a2[0]), max(a1[0], a2[0]) + 1):
            for j in range(min(a1[1], a2[1]), max(a1[1], a2[1]) + 1):
                if grid[i][j] != 0 and ccw((i,j), b1, b2) != ccw((i,j), a2, a1):
                    return True
        return False
    else:
        return False

def euclidean_distance(a, b):
    return math.sqrt((a[0]-b[0])**2 + (a[1]-b[1])**2)

def find_path(nodes, start, end):
    nodes_sorted_start = sorted(nodes, key=lambda node: euclidean_distance(node, start))
    nodes_sorted_end = sorted(nodes, key=lambda node: euclidean_distance(node, end))

    # Find path starting from start
    path_start = [start]
    for node in nodes_sorted_start:
        path_start.append(node)
        valid_path = True
        for i in range(len(path_start) - 2):
            for j in range(i + 2, len(path_start)):
                if line_intersects(path_start[i], path_start[i+1], path_start[j-1], path_start[j]):
                    valid_path = False
                    break
            if not valid_path:
                break
        if not valid_path:
            path_start.pop()
        else:
            if path_start[-1] == end:
                break

    # Find path starting from end
    path_end = [end]
    for node in nodes_sorted_end:
        path_end.append(node)
        valid_path = True
        for i in range(len(path_end) - 2):
            for j in range(i + 2, len(path_end)):
                if line_intersects(path_end[i], path_end[i+1], path_end[j-1], path_end[j]):
                    valid_path = False
                    break
            if not valid_path:
                break
        if not valid_path:
            path_end.pop()
        else:
            if path_end[-1] == start:
                break

    # Combine paths
    path_start.pop(0)  # Remove start node from path_start
    path_end.pop(0)  # Remove end node from path_end
    path = path_start + path_end[::-1]

    return path

# Find the paths between the nodes
nodes = [(10, 4), (12, 5), (4, 11), (4, 3), (8, 5), (14, 7), (2, 11), (0, 14)]
path = find_path(nodes, start, goal)

# Print the paths
print(path)

# Extract x and y coordinates from the path list
x_coords = []
y_coords = []

# for path in paths:
for point in path:
	x_coords.append(point[0])
	y_coords.append(point[1])

# Plot map and path
fig, ax = plt.subplots(figsize=(20, 20))
colors = ['#EDE5D8', '#C70039', '#FFC300', '#DAF7A6', '#EDE5D8']
cmap = matplotlib.colors.ListedColormap(colors)

# Create a boundary around each non-zero square
for i in range(grid.shape[0]):
    for j in range(grid.shape[1]):
        if grid[i, j] != 0:
            rect = plt.Rectangle((j - 0.5, i - 0.5), 1, 1, fill=False, edgecolor='black', lw=2)
            ax.add_patch(rect)

# Plot the grid with the specified color scheme
ax.imshow(grid, cmap=cmap)

# Plot the nodes
for node in nodes:
    ax.scatter(node[1], node[0], marker="o", color="blue", s=2000)

# Plot the start and goal points
ax.scatter(start[1], start[0], marker="o", color="red", s=2000)
ax.scatter(goal[1], goal[0], marker="o", color="green", s=2000)

# Plot the path
ax.plot(y_coords, x_coords, color="black", linewidth=5)

from io import BytesIO

fs = GridFS(mydb)

# Define the arrow object outside of the loop
for i in range(len(path) - 1):
    arrow1 = arrow(path[i][1], path[i][0], path[i+1][1] - path[i][1], path[i+1][0] - path[i][0], width=0.1, color='red', zorder=2)
    filename = 'file' + str(i) + '.png'
    img_data = BytesIO()
    plt.savefig(img_data, format='png')
    img_data.seek(0)
    fs.put(img_data, filename=filename)
    arrow1.set_visible(False)


plt.savefig('file.png')

