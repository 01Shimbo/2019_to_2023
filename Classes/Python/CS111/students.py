import csv

def main():
    read_dict ("students.csv")
    pass

def read_dict(filename):
    """Read the contents of a CSV file into a
    dictionary and return the dictionary.

    Parameters
        filename: the name of the CSV file to read.
    Return: a dictionary that contains
        the contents of the CSV file.
    """
    students = {}
    with open(filename, "rt") as csv_file:
        reader = csv.reader(csv_file)
        next(reader)
        for row_list in reader: 
            students[row_list[0]] = row_list 
    return students


if __name__ == "__main__":
    main()