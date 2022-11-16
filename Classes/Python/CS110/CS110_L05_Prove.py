
"""
File: CS110_L05_Prove.py
Author: Shane Duke

Purpose: Practicing if statements
"""


def main():
    # START
    a1 = ''
    a2 = ''
    a3 = ''
    while True:
        print("\nYou are walking through a dark forest and find two items:")
        print("a MATCH and a FLASHLIGHT. Which one do you want to pick up?")
        a1 = input("").lower()
        if a1 == "match":
            break
        elif a1 == "flashlight":
            break
        else:
            print("\nPlease choose one option.\n")
            continue
    # MATCH
    while a1 == "match":
        print("\nYou pick up the match and strike it, and for an instant,")
        print("the forest around you is illuminated. You see a large grizzly bear,")
        print("and then the match burns out.")
        print("Do you want to RUN, or HIDE behind a tree?")
        a2 = input("").lower()
        if a2 == "run":
            break
        elif a2 == "hide":
            break
        else:
            print("\nPlease choose one option.\n")
            continue

    # MATCH > RUN
    if a2 == "run":
        print("\nYou run fast but can't see in front of you and tumble down a hill and become unconscious")
        print("Sorry, you lost.")

    # MATCH > HIDE
    while a2 == "hide":
        print('\nYou hide from the bear by ducking into a near by bush. the bear speaks out saying')
        print('"You can come out no need to hide."')
        print("do you MEET the bear or STAY in hiding?")
        a3 = input("").lower()
        if a3 == "meet":
            break
        elif a3 == "stay":
            break
        else:
            print("\nPlease choose one option.\n")
            continue

    # MATCH > HIDE > MEET
    if a3 == "meet":
        print("\nThe friendly bear walks you back to town")
        print("Congrats you won!")

    # MATCH > HIDE > STAY
    if a3 == "stay":
        print("\nafter some time the bear walks off and you wonder around all night never finding your way home.")
        print("Sorry, you lost.")

    # FLASHLIGHT
    while a1 == "flashlight":
        print("\nYou pick up the flashlight and turn it on. You see the pathway")
        print("lit up in front of you, but you thought you also heard something")
        print("off to the side. Do you want to FOLLOW the path or LOOK in the")
        print("trees for the thing that made the noise?")
        a2 = input("").lower()
        if a2 == "follow":
            break
        elif a2 == "look":
            break
        else:
            print("\nPlease choose one option.\n")
            continue

    # FLASHLIGHT > FOLLOW
    while a2 == "follow":
        print("\nYou take a step forward and feel something whizz past you and")
        print("a loud thud. do you RUN or do you LOOK at what made the noise?")
        a3 = input("").lower()
        if a3 == "run":
            break
        elif a3 == "look":
            break
        else:
            print("\nPlease choose one option.\n")

    # FLASHLIGHT > FOLLOW > LOOK
    if a3 == "look":
        print("\nYou see many glowing eyes swarming around you then darkeness")
        print("Sorry, you lost.")

    # FLASHLIGHT > FOLLOW > RUN
    if a3 == "run":
        print(
            "\nYou take off running and run though bushes and trees scraching up your face")
        print("You make it back to town ")
        print("Congrats you won!")

    # FLASHLIGHT > LOOK
    if a2 == "look":
        print('\nYou look up into the tree and see a wrinkled goblin wearing only a loin cloth.')
        print('The goblin swings from a limb and grabs your fanny pack,  and searches out in a high-pitched voice')
        print('"Now got a couple of bucks in my pocket, I can now buy some hot pockets"')
        print('the goblin ducks into some bushes. You sit on a nearby rock and put your hands into your face.')
        print("you lost to the goblin")


if __name__ == "__main__":
    main()
