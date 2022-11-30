import csv

def main():
    path = "products.csv"
    # filename = "products.csv"
    PRODUCTS_KEY = 0
    print(read_dict(path, PRODUCTS_KEY))
    pass


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
