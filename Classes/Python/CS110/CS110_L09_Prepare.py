def main():
    friends = []
    while True:
        friend = input("Type the name of a friend: ")
        if friend != "end":
            friends.append(friend)
        else:
            print("Your friends are: ")
            for i in friends:
                print(i)
            break

if __name__ == "__main__":
    main()