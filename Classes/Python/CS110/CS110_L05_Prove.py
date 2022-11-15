
"""
File: CS110_L05_Prove.py
Author: Shane Duke

Purpose: Practicing if statements
    q1: match
        q2: run
        q2: hide
    q1: flashlight


"""


def main():
    while True:

        print("\nYou are walking through a dark forest and find two items:")
        print("a MATCH and a FLASHLIGHT. Which one do you want to pick up?")
        q1 = input("").lower()
        if q1 == "match":
            break
        elif q1 == "flashlight":
            break
        else:
            print("\nPlease choose one option.\n")
            continue

    while q1 == "match":
        print("\nYou pick up the match and strike it, and for an instant,")
        print("the forest around you is illuminated. You see a large grizzly bear,")
        print("and then the match burns out.")
        print("Do you want to RUN, or HIDE behind a tree?")
        q2 = input("").lower()
        if q2 == "run":
            break
        elif q2 == "hide":
            break
        else:
            print("\nPlease choose one option.\n")
            continue

    while q1 == "flashlight":
        print("\nYou pick up the flashlight and turn it on. You see the pathway")
        print("lit up in front of you, but you thought you also heard something")
        print("off to the side. Do you want to FOLLOW the path or LOOK in the")
        print("trees for the thing that made the noise?")
        q2 = input("").lower()
        if q2 == "follow":
            break
        elif q2 == "look":
            break
        else:
            print("\nPlease choose one option.\n")
            continue


if __name__ == "__main__":
    main()
