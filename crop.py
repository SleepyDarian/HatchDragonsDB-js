from PIL import Image

img = Image.open("app/static/dragons/photo_2026-05-07_18-24-44.jpg")
w, h = img.size
size = 128
x_offset = 48
y_offset = 18
left = 183
top  = 2144
print(w, h)
print(size)
print(left)
print(top)
cropped = img.crop((left, top, left + size, top + size))
cropped.save("app/static/dragons/Ancient Gnarlroot.jpg")