
"""
File: CS110_L05_Prepare.py
Author: Shane Duke

Purpose: Practicing if statements
"""


def main():
    # gets two numbers from user
    num_one = int(input("What is the first whole number? "))
    num_two = int(input("What is the second whole number? "))
    fav_animal = "Cat"

    # compares the two numbers
    if num_one > num_two:
        print("The first number is greater.")
    else:
        print("The first number is not greater.")

    if num_one == num_two:
        print("The numbers are equal.")
    else:
        print("The numbers are not equal.")

    if num_one < num_two:
        print("The second number is greater.")
    else:
        print("The second number is not greater.")

    # asks for favorite animal and returns if it is mine too
    animal = input("\nWhat is your favorite animal? ")
    if fav_animal.lower() == animal.lower():
        print("That's my favorite animal too!")
    else:
        print("That one is not my favorite.")


if __name__ == "__main__":
    main()
