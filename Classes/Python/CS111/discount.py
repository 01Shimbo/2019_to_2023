from datetime import datetime


def main():
    subtotal = float(input("subtotal: $"))
    salesTax = subtotal - (subtotal / 1.06)
    # dayOfWeek = datetime.now().weekday()
    dayOfWeek = 2
    if subtotal <= 50 and dayOfWeek == 1 or dayOfWeek == 2:
        isDiscount = True
    else:
        isDiscount = False

    if isDiscount == False:
        total = subtotal + salesTax
        print(f"Sales tax amount : ${salesTax:.2f}")
        print(f"Total: ${total:.2f}")
    if isDiscount == True:
        discount = subtotal - (subtotal / 1.1)
        total = (subtotal - discount) + salesTax
        print(f"Discount : ${discount:.2f}")
        print(f"Sales tax amount : ${salesTax:.2f}")
        print(f"Total: ${total:.2f}")

if __name__ == "__main__":
    main()
