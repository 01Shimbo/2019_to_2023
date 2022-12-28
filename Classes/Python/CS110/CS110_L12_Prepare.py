import csv


def main():
    ENTITY = 0
    CODE = 1
    YEAR = 2
    LIFE_EXPECTANCY = 3
    # call function to get data from the csv
    data_list = get_data()
    
    print (data_list)
    youngest = 120
    youngest_person = []
    for i in range(len(data_list)):
        person = data_list[i]
        age = int(person[1])
        if age < youngest:
            youngest = age
            youngest_person = person
    print (f"youngest person is: {youngest_person[0]} and is {youngest_person[1]} years old")
    
    

def get_data():
    people = [
        "Stephanie 36",
        "John 29",
        "Emily 24",
        "Gretchen 54",
        "Noah 12",
        "Penelope 32",
        "Michael 2",
        "Jacob 10"
    ]
    list_people = [[]]
    for i in range(len(people)):
        person = people[i].split(" ")
        name = person[0]
        age = person[1]
        list_people.append([name, age])
    list_people.pop(0)
    return list_people

   

if __name__ == "__main__":
    main()
