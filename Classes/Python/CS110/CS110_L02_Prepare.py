"""
File: CS110_L02_Prepare
Author: Shane Duke

Purpose: ask and display formated name
"""

def question():
    input0 = input("What is your first name?: ")
    input1 = input("What is your last name?: ")
    return input0, input1

    
andswers = question()     
firstName = andswers[0].capitalize()
lastName = andswers[1].capitalize()



print(f"Your name is {lastName}, {firstName} {lastName}.")