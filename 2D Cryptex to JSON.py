from PIL import Image
import json

im = Image.open("Cryptex 50.png") #Can be many different formats.
pix = im.load()
print im.size #Get the width and hight of the image for iterating over

pixels = []
for maze_slice in range(0, im.size[0]):
	pixels.append([])
	for letter in range(0, im.size[1]):
		# True means wall
		wall = pix[maze_slice, letter] == (255, 255, 255)
		pixels[-1].append(wall)

print json.dumps(pixels)

with open('Cryptex 50.json', 'w') as outfile:
    json.dump(pixels, outfile)
