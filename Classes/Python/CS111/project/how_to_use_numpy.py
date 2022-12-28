import numpy as np
import requests
import csv
import time
# the out put is not important here, becase we are not looking at the data but at the time it takes
# to reorgaize data in a normal compound list and a numpy list.


def main():

    data_list = []
    csv_url = "https://raw.githubusercontent.com/BuzzFeedNews/nics-firearm-background-checks/master/data/nics-firearm-background-checks.csv"
    with requests.Session()as session:
        download = session.get(csv_url)
        decoded_content = download.content.decode('utf-8')
        reader = csv.reader(decoded_content.splitlines())
        next(reader)
        for row in reader:
            data_list.append(row)
    # creat np array
    np_data_list = np.array(data_list)

    start_time = time.time()
    search_normal_data(data_list)
    search_normal_data(data_list)
    search_normal_data(data_list)
    search_normal_data(data_list)
    search_normal_data(data_list)
    print(
        f"time to get data from normal compound list in secounds:{time.time() - start_time}")
    start_time = time.time()
    search_np_data(np_data_list)
    search_np_data(np_data_list)
    search_np_data(np_data_list)
    search_np_data(np_data_list)
    search_np_data(np_data_list)
    print(
        f"time to get data from np array in secounds:{time.time() - start_time}")


def search_normal_data(data_list):
    search_return = []
    for i in range(len(data_list)):
        line = data_list[i]
        state = line[1]
        if state == "Idaho":
            search_return.append(line)

    return search_return


def search_np_data(np_data_list):
    search = np.where(np_data_list[:, 1] == 'Idaho')
    return (np_data_list[search])


if __name__ == "__main__":
    main()
