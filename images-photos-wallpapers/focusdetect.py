import sys
import os
import subprocess
from pathlib import Path
import cv2 as cv

directory = Path(sys.argv[1])
output = Path("blurryimages.txt")

extensions = {".cr2", ".png", ".jpg", ".jpeg",}

for file in directory.iterdir():
    if file.suffix.lower() not in extensions:
        continue
    image = cv.imread(str(file))
    grayscale = cv.cvtColor(image, cv.COLOR_BGR2GRAY)
    laplacian = cv.Laplacian(grayscale, cv.CV_64F).var()
    if laplacian<15: # adjust this for threshold
        subprocess.run(["fyi", "Out of focus image detected: path saved to file."])
        with open(output, "a") as f:
            f.write(str(file.resolve()) + "\n")
