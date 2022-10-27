from datetime import datetime
import math
import os
import pathlib

curDate = datetime.now(tz=None)
volPath = os.path.join(pathlib.Path().resolve(), 'volumes.txt')
print(f'Current date: {curDate:%Y-%m-%d}')
width = int(input("Enter the width of the tire in mm (ex 205): "))
aspectRatio = int(input("Enter the aspect ratio of the tire (ex 60): "))
diameter = int(input("Enter the diameter of the wheel in inches (ex 15):"))

vol = math.pi * (width ** 2) * aspectRatio * \
    ((width * aspectRatio) + (2_540 * diameter)) / 10_000_000_000
print(f'The aproximate volume is {vol:.2f} liters')

if width == 205 and aspectRatio == 65 and diameter == 16:
    price = 135
elif width == 205 and aspectRatio == 60 and diameter == 15:
    price = 65
elif width == 215 and aspectRatio == 60 and diameter == 17:
    price = 97
elif width == 235 and aspectRatio == 65 and diameter == 17:
    price = 100
else:
    price = 0

if price == 0:
    print("Contact us for price")
else:
    print(f'The price is ${price}/each')

while True:
    print("whould you like to buy a tire? y | n")
    favColor = input("")
    if favColor == "y":
        print('What is your phone number?')
        phone = input("")
        try:
            with open(volPath, 'a') as vol_file:
                print(
                    f"{curDate:%Y-%m-%d}, {width}, {aspectRatio}, {diameter}, {vol:.2f}, {phone}", file=vol_file)
        except:
            print("Saving to volumes.txt failed due to premsissions most likely.")
            print(
                "make sure your current working directory is where the script is located")
        break
    if favColor == "n":
        print("Come Again!")
        try:
            with open(volPath, 'a') as vol_file:
                print(
                    f"{curDate:%Y-%m-%d}, {width}, {aspectRatio}, {diameter}, {vol:.2f}", file=vol_file)
        except:
            print("Saving to volumes.txt failed due to premsissions most likely.")
            print(
                "make sure your current working directory is where the script is located")
        break
    else:
        print("type a 'y' or 'n' then press enter")
        continue