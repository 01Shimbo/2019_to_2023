"""
File: CS110_L01_Assignment.py
Author: Shane Duke

Purpose: Ask user for favorite color
         Return favorite color
"""


def question():
    userInput = input("What is your favorite color?: ")
    return userInput


while True:
    print("do you have a favorite color? y | n")
    favColor = input("")
    if favColor == "y":
        color = question()
        print(f'The best color is {color}')
        break
    if favColor == "n":
        print("Everybody has a favorite color!")
        continue
    else:
        print("type a 'y' or 'n' then press enter")
        continue
