def main():
    provences = read_list("provinces.txt")
    print(provences)
    print()
    provences.pop(0)
    provences.pop()
    
    for i in range(len(provences)):
        if provences[i] == 'AB':
            provences[i] = 'Alberta'
    count = provences.count("Alberta")
    print(f"Alberta occurs {count} times in the modified list.")


def read_list(filename):
    """Read the contents of a CSV file into a compound
    dictionary and return the dictionary.

    Parameters
        filename: the name of the CSV file to read.
        key_column_index: the index of the column
            to use as the keys in the dictionary.
    Return: a compound dictionary that contains
        the contents of the CSV file.
    """
    newlist = []
    with open(filename, "rt") as txt_file:
        for row in txt_file:
            clean_line = row.strip() 
            newlist.append(clean_line)

    return newlist

if __name__ == "__main__":
    main()


