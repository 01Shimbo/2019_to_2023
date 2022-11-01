def main():
    # Testing input
    # firstName = "jane"
    # lastName = "doe"
    # email = "JaneDoe@email.com"
    # phone = "(208) 555-1234"
    # job = "chief software architect"
    # idNum = "83-23821"
    # hairColor = "brown"
    # eyeColor = "blue"
    # month = "september"
    # trained = "n"

    print("Please enter the following information:")
    firstName = input("First name: ")
    lastName = input("Last name: ")
    email = input("Email address: ")
    phone = input("Phone number: ")
    job = input("Job title: ")
    idNum = input("ID Number: ")
    hairColor = input("Hair color: ")
    eyeColor = input("Eye color: ")
    month = input("Month Started: ")
    trained = input("Have you been trained? y | n : ")
    if trained == "y":
        trained = "yes"
    elif trained == "n":
        trained = "no"
    else:
        print(f"\ntype 'y' or 'n' then press enter")
        print("incorrect input")
        return

    print()
    print("The ID Card is:")
    print("----------------------------------------")
    print(f"{lastName.upper()},{firstName.capitalize()}")
    print(f"{job.title()}")
    print(f"ID: {idNum}")
    print()
    print(f"{email.lower()}")
    print(f"{phone}")
    print()
    print(f"Hair: {hairColor.capitalize():15} \t Eyes:{eyeColor.capitalize()} ")
    print(
        f"Month: {month.capitalize():14} \t Training:{trained.capitalize()} ")
    print("----------------------------------------")


if __name__ == "__main__":
    main()
