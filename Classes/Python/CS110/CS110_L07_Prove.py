def main():
    andswer = "temple"
    guess = ""
    guess_count = 0

    print("Welcome to the word guessing game!\n")
    guess = input("What is your guess? ")

    while guess != andswer:
        print("Your guess was not correct.")
        guess = input("What is your guess? ")
        guess_count += 1

    print("Congratulations! You guessed it!")
    print(f"It took you {guess_count} guesses.")


if __name__ == "__main__":
    main()
