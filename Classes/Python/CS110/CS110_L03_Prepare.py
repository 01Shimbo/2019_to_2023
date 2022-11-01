import math
"""
File: CS110_L03_Prepare.py
Author: Shane Duke

Purpose: Practice converting user input to numeric data types and perform calculations.
"""
def main():
    print("How old are you?")
    try:
        age = int(input(""))
    except:
        print("please enter a number.")
        print()
    print(f"On your next birthday, you will be {age + 1}")
    print()
    # Egg Cal
    print("How many egg cartons do you have?")
    try:
        eggs = math.ceil(float(input("")) * 12)
    except:
        print("please enter a number.")
        print()
    print (f"You have {eggs} eggs")
    print()
    # Cookie Cal
    print("How many cookies do you have?")
    try:
        cookies = float(input (""))
    except:
        print("please enter a number.")
        print()
    print("How many people are there?")
    try:
        people = int(input (""))
    except:
        print("please enter a number.")
        print()
    print (f"Each person may have {cookies / people :.2f} cookies")



if __name__ == "__main__":
    main()
