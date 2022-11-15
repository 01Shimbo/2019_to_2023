def main():
    first_age = int(input("What is your age? "))
    first_height = int(input("What is your height (inches)? "))
    is_second = input("Is there a second rider (yes/no)? ")
    if is_second == "yes":
        second_age = int(input("What is your age? "))
        second_height = int(input("What is your height (inches)? "))

    # double riders
        if first_height < 36 or second_height < 36:
            print("Sorry, you may not ride.")
        elif is_second == "yes" and first_age >= 18 and second_age >= 18:
            print("Welcome to the ride. Please be safe and have fun!")

    # single rider
    if is_second == "no":
        # if single rider is above 62 inches and above 18 he can ride
        if first_height >= 62 and first_age >= 18:
            print("Welcome to the ride. Please be safe and have fun!")
        elif first_height < 36:
            print("Sorry, you may not ride.")
    else:
        print("Sorry, you may not ride.")


if __name__ == "__main__":
    main()
