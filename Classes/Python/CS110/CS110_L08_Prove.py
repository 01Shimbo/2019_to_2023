from re import search


def main():
    andswer = "temple"
    guess = ""
    guess_count = 0
    hint = []
    for letter in andswer:
        letter = "_"
        hint.append(letter)
    hint = " ".join(map(str, hint))
    print("Welcome to the word guessing game!\n")
    print("Your hint is: ", hint)
    guess = input("What is your guess? ")

    while len(guess) != len(andswer):

        print(f"please type {len(andswer)} of characters")
        print("Your hint is: ", hint)
        guess = input("What is your guess? ")
        if len(guess) == len(andswer):
            break
        else:
            continue

    while guess != andswer:
        print()
        print("Your guess was not correct.")
        print(f"Your hint is:")

        for i in range(len(andswer)):
            # a_dict = {}
            # for  a_enum, a_letter in enumerate(andswer):
            #   a_dict.update({a_enum: a_letter})
            # print (a_dict.keys())
            for g_enum, g_letter in enumerate(guess):
                is_letter_matching = search(g_letter, andswer)
                print(is_letter_matching)
                
                if i == g_enum and is_letter_matching:
                    hint = g_letter.upper()
                elif is_letter_matching:
                    hint = (g_letter.lower())
                else:
                    hint = '_ '
                    print(hint)
                    print(g_letter, end="")
        print()
        guess = input("What is your guess? ")

        # while len(guess) != len(andswer):
        #     print(f"please type {len(andswer)} of characters")
        #     print("Your hint is: ", hint)
        #     guess = input("What is your guess? ")
        #     if len(guess) == len(andswer):
        #         break
        #     else:
        #         continue
        # guess_count += 1

    print("Congratulations! You guessed it!")
    print(f"It took you {guess_count} guesses.")

    # for a_enum,a_letter in enumerate(andswer):
    #     for g_enum,g_letter in enumerate(guess):
    #         if a_enum == g_enum and a_letter == g_letter:
    #             g_letter = g_letter.upper()
    #         elif a_letter == g_letter:
    #             g_letter = (g_letter.lower())
    #         else:
    #             g_letter = '_'
    #     print (g_letter, end="")

    # hint_list = []
    # for letter in guess:
    #     hint_list.append(letter.lower())
    # count = -1
    # for letter in andswer:
    #     count += 1
    #     # checks to see if location is correct
    #     if letter == hint_list[count]:
    #         hint_list.pop(count)
    #         hint_list.insert(count, letter.upper())
    #     # checks to see if the word exists in array
    #     elif letter == list(set(hint_list)):
    #         # sets cannot have a duplicate in them so converting the
    #         # array to a set then back to a list will remove duplicates
    #         hint_list.pop(count)
    #         hint_list.insert(count, letter.lower())
    #     # puts a underscore everywere else
    #     else:
    #         hint_list.pop(count)
    #         hint_list.insert(count, "_")


if __name__ == "__main__":
    main()
