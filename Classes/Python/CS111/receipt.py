import csv
from datetime import datetime


def main():
    filename = "products.csv"
    curDate = datetime.now(tz=None)
    subtotal = 0
    num_of_items = 0
    PRODUCTS_KEY = 0
    PRODUCT = 1
    PRICE = 2
    try:
        products = read_dict(filename, PRODUCTS_KEY)
        with open("request.csv", "rt") as csv_file:
            reader = csv.reader(csv_file)
            next(reader)
            print("Inkom Emporium")
            print()
            for row in reader:
                item = products[row[PRODUCTS_KEY]]
                quantity = row[1]
                print(f'{item[PRODUCT]}: {quantity} @ {item[PRICE]}')
                subtotal += float(item[PRICE])
                num_of_items += int(quantity)
            sales_tax = subtotal - (subtotal / 1.06)
            total = subtotal + sales_tax
            print()
            print(f"Number of Items:{num_of_items}")
            print(f"Subtotal: {subtotal:.2f}")
            print(f"Sales Tax: {sales_tax:.2f}")
            print(f"Total:{total:.2f}")
            print()
            print("Thank you for shopping at the Inkom Emporium")
            print(f"{curDate:%c}")
    except (FileNotFoundError, PermissionError) as error:
        print(error)
        print("Please choose a different file.")

    except ValueError as val_err:
        print("Error:", val_err)

    except (csv.Error, KeyError) as error:
        print(f"Error: unknown product ID in the request.csv file"
              ,row[PRODUCTS_KEY] )


def read_dict(filename, key_column_index):
    """Read the contents of a CSV file into a compound
    dictionary and return the dictionary.

    Parameters
        filename: the name of the CSV file to read.
        key_column_index: the index of the column
            to use as the keys in the dictionary.
    Return: a compound dictionary that contains
        the contents of the CSV file.
    """
    products = {}
    with open(filename, "rt") as csv_file:
        reader = csv.reader(csv_file)
        next(reader)
        for row_list in reader:
            products[row_list[key_column_index]] = row_list
    return products


if __name__ == "__main__":
    main()
