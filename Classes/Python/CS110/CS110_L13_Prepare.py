def main():
    message = input("What is your message? ")
    display_regular(message)
    display_uppercase(message)
    display_lowercase(message)


def display_regular(message):
    print(message)
    pass


def display_uppercase(message):
    print(message.upper())
    pass


def display_lowercase(message):
    print(message.lower())
    pass


main()
