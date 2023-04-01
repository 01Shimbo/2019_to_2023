def main():
    # NAME = 0
    # ID_NUMBER = 1
    # JOB_TITLE = 2
    # SALARY = 3

    # hr = (get_data("hr_system.txt"))
    # # print (hr)
    # for emp in hr:
    #     print ((float(emp[SALARY])) / 24)
    #     # pay = emp[SALARY]
    #     # pay = int(pay) /24
    #     print(f"Name :{emp[NAME]}, Title: {emp[JOB_TITLE]} - ${float(emp[SALARY])}")

    #     pass

    books_chapters = get_data("books_and_chapters.txt")
    print(books_chapters)
    largest = 0
    largest_book = []
    for i in range(len(books_chapters)):
        
        chapter = int(books_chapters[i])
        if chapter > largest:
            largest = chapter
            largest_book = books_chapters[i]
            print(largest)
        print(largest_book)




def get_data(filename):
    newlist = []
    with open(filename, "rt") as txt_file:
        for row in txt_file:
            clean_line = row.strip()
            split_line = clean_line.split(":")
            newlist.append(split_line)

    return newlist


if __name__ == "__main__":
    main()
