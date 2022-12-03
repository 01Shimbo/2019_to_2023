def main():

    items = []
    print("Please enter the items of the shpping list (type: quit to finsih)")
    while True:
        item = input("Item: ")
        if item != "quit":
            items.append(item)
        else:
            print()
            print("The shopping list is:")
            for item in items:
                print(item)
            print()

            print("The shopping list with indexes is:")
            for i in range(len(items)):
                print(f"{i}. {items[i]}")
            break


if __name__ == "__main__":
    main()
