import csv


def main():
    ENTITY = 0
    CODE = 1
    YEAR = 2
    LIFE_EXPECTANCY = 3
    # call function to get data from the csv
    world_in_data = get_data("life-expectancy.csv")

    # pre-sets vars to get data from the whole file
    highest_reported_entity = []
    highest_reported = 0
    lowest_reported_entity = []
    lowest_reported = 1_000_000

    search = (input("Enter the year of interest: "))
    results = []
    for i in range(len(world_in_data)):
        line = world_in_data[i]
        expectancy = float(line[LIFE_EXPECTANCY])

        # gets min and max of all data in the file
        if expectancy < lowest_reported:
            # sets new lowest number
            lowest_reported = expectancy
            # set new lowest as a list with all the data (country, date, and life expectancy)
            lowest_reported_entity = line
        elif expectancy > highest_reported:
            highest_reported = expectancy
            highest_reported_entity = line

        # gets all data from the year inputted to a new list
        if (line[YEAR]) == search:
            results.append(line)

    # pre-sets vars to get data from the selected year
    lowest = 1_000_000
    highest = 0
    highest_entity = []
    lowest_entity = []
    avg = 0
    # loops though data from list that matches year entered
    for i in range(len(results)):
        expectancy = float(line[LIFE_EXPECTANCY])

        # gets highest and lowest life expextancy
        if expectancy < lowest:
            lowest = expectancy
            lowest_entity = line
        elif expectancy > highest:
            highest = expectancy
            highest_entity = line
        # gets avg of inputted year
        line = results[i]
        avg += float(line[LIFE_EXPECTANCY])
    avg = avg / (i + 1)

    print(
        f"\nThe overall max life expectancy is: {highest_reported_entity[LIFE_EXPECTANCY]} from {highest_reported_entity[ENTITY]} in {highest_reported_entity[YEAR]  }")
    print(
        f"The overall min life expectancy is: {lowest_reported_entity[LIFE_EXPECTANCY]} from {lowest_reported_entity[ENTITY]} in {lowest_reported_entity[YEAR]  }")
    print(f"\nfor the year {search}:")
    print(f"The average life expectancy across all countries was: {avg:.2f}")
    print(
        f"The max life expectancy was in: {highest_entity[ENTITY]} with {highest_entity[LIFE_EXPECTANCY]}")
    print(
        f"The min life expectancy was in: {lowest_entity[ENTITY]} with {lowest_entity[LIFE_EXPECTANCY]}")


def get_data(filename):
    """_summary_
        get data from csv and format it as a compound list
    Args:
        filename (string):location of csv

    Returns:
        compound_list of csv file's contents
    """
    newlist = [[]]
    with open(filename, "rt") as csv_file:
        reader = csv.reader(csv_file)
        next(reader)
        for row in reader:
            newlist.append(row)
        newlist.pop(0)
    return newlist


if __name__ == "__main__":
    main()
