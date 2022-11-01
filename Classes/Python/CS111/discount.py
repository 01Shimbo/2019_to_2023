from datetime import datetime


def main():
    subtotal = float(input("subtotal: $"))
    salesTax = subtotal - (subtotal / 1.06)
    # dayOfWeek = datetime.now().weekday()
    dayOfWeek = 2
    if subtotal > 50 and dayOfWeek == 1 or dayOfWeek == 2:
        discount = True
        print(discount)
    #     total = subtotal - (subtotal / 1.1 )
    else:
        discount = False
        print(discount)

    total = subtotal + salesTax

    print(f"Sales tax amount : ${salesTax:.2f}")
    print(f"Total: ${total:.2f}")


if __name__ == "__main__":
    main()
