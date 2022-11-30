
def main():
    print ("Welcome to the Shopping Cart Program!")
    action = 0
    shoping_cart = [["bed", 100.00], ["socks" , 100.00]]
    while True:
        print ("1. Add item \n2. View cart\n3. Remove item\n4. Compute total\n5. Quit")
        action = input("Please enter an action: ")
        # Add item
        if action == "1":
            i = input("What item would you like to add? ")
            price = input(f"What is the price of '{i}'? ")
            price = float(price)
            print (f"'{i}' has been added to the cart.")
            shoping_cart.append([i ,price])
        # View cart 
        elif action == "2":
            if shoping_cart != []:
                count = 0
                for i, price in shoping_cart:
                    count += 1
                    print (f"{count}. {i} - ${price:.2f}")
                print()
            else:
                print("Please put in item in the cart")
        # Remove item
        elif action == "3":
            pass
        # Compute total
        elif action == "4":
            pass
        # quit
        elif action == "5":
            break
        else:
            print()
            print ("please enter a number bettween 1 and 5")
            print()

        


if __name__ == "__main__":
    main()
