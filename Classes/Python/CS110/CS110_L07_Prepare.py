def main():
    num = 0
    num = int(input("Please type a postivie number: "))
    while num < 0:
        print("Sorry, that is a negative number. Please try again.")
        num = int(input("Please type a postivie number: "))

    print(f"The number is: {num}")

    print()
    
    is_candy = ""
    while is_candy != "yes":
        is_candy = input("May I have a pice of candy? ")
    print("Thank You")

if __name__ == "__main__":
    main()