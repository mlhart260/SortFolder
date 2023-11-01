#! /usr/local/bin/python3

import os
import shutil as sh

# Type your downloads file location here
downloads = " " # "/Users/yourname/Downloads"

# Type the location of your destination folders here
movies = " " # "/Users/name/Downloads/movies"
pictures = " " # "/Users/name/Downloads/pictures"
pdfs = " " # "/Users/name/Downloads/pdfs"
screenshots = " " #"/Users/name/Downloads/pictures/screenshots"


list = os.listdir(downloads)
pdfType = ["pdf"]
pictureType = ["HEIC", "jpeg", "JPG", "PNG", "png", "JPEG", "heic", "jpg"]
movieType = ["MOV","mov"]


print(len(list))

for idx in range(len(list)):
    if list[idx][0] == ".":
        print(f"hidden file at index: {idx}")
    if "Screen Shot" in list[idx]:
       try:
            sh.move(f"{downloads}/{list[idx]}",screenshots) 
       except sh.Error:

           print(f"duplicate screenshot found? {list[idx]}")

    else:
        temp = list[idx].split(".")
        if len(temp) >= 2 and (temp[-1] in pdfType or temp[-1] in pictureType or temp[-1] in movieType):
            if temp[-1] in pictureType:
                try:
                    sh.move(f"{downloads}/{list[idx]}",pictures)
                except sh.Error:

                    print(f"duplicate picture found? {list[idx]}")
            elif temp[-1] in movieType:
                try:
                    sh.move(f"{downloads}/{list[idx]}",movies)
                except sh.Error:

                    print(f"duplicate movie found? {list[idx]}")
            elif temp[-1] == "pdf":
                try:
                    sh.move(f"{downloads}/{list[idx]}",pdfs)
                except sh.Error:

                    print(f"Duplicate pdf found? {list[idx]} ")
            else:
                print(f"skipped at index {idx}")

