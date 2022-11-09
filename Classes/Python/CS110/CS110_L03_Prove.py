def main():

    childAmt = float(input("What is the price of a child's meal? $"))
    audltAmt = float(input("What is the price of an adult's meal? $"))
    children = int(input("How many children are there? "))
    adults = int(input("How many adults are there? "))
    subtotal = (childAmt * children) + (audltAmt * adults)
    while True:
        print("Would you like a cookie for $1.25 each (y or n) ")
        cookieInput = input("")
        if cookieInput == 'y':
            cookie = int (input("How many? ")) * 1.25 
            subtotal = subtotal + cookie
            break
        elif cookieInput == 'n':
            break
        else:
            continue
    tax = int(input("What is the sales tax rate? "))

    salesTax = subtotal * (tax / 100)


    total = subtotal + salesTax
    print(f"\nSubtotal: ${subtotal}")
    print(f"Salestax: ${salesTax:.2f}")
    print(f'Total: ${total:.2f}')

    payment = float(input(f'\nWhat is the payment amount? $'))
    if payment < subtotal:
        print ("Excuse me, this isn't going to cover it you are going to have to wash dishes to cover your meal!")
    else:
        print(f'Change: ${payment - total:.2f}')
        print("Come again!")


if __name__ == "__main__":
    main()
