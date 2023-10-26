#! /usr/local/bin/python3

import os
import shutil as sh

# Type your downloads file location here
downloads = " " # "/Users/yourname/Downloads"

# Type the location of your destination folders here
movies = " " # "/Users/name/Downloads/movies"
pictures = " " # "/Users/name/Downloads/pictures"
pdfs = " " # "/Users/name/Downloads/pdfs"


list = os.listdir(downloads)
pdfType = ["pdf"]
pictureType = ["HEIC", "jpeg", "JPG", "PNG", "png", "JPEG", "heic", "jpg"]
movieType = ["MOV","mov"]


print(len(list))

for idx in range(len(list)):
    if list[idx][0] == ".":
        print(f"hidden file at index: {idx}")
    else:
        temp = list[idx].split(".")
        if len(temp) >= 2 and (temp[-1] in pdfType or temp[-1] in pictureType or temp[-1] in movieType):
            if temp[-1] in pictureType:
                sh.move(f"{downloads}/{list[idx]}",pictures)
            elif temp[-1] in movieType:
                sh.move(f"{downloads}/{list[idx]}",movies)
            elif temp[-1] == "pdf":
                sh.move(f"{downloads}/{list[idx]}",pdfs)
            else:
                print(f"skipped at index {idx}")

