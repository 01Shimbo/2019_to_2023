def main():
    data = (get_data("books.txt"))
    pass


def get_data(filename):
    newlist = []
    with open(filename, "rt") as txt_file:
        for row in txt_file:
            clean_line = row.strip()
            newlist.append(clean_line)
            print(clean_line)

    return newlist


if __name__ == "__main__":
    main()