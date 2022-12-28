import time
import numpy as np
import requests
import csv



def time_search_np_data():
    data_list = []
    csv_url = "https://raw.githubusercontent.com/BuzzFeedNews/nics-firearm-background-checks/master/data/nics-firearm-background-checks.csv"
    with requests.Session()as session:
        download = session.get(csv_url)
        decoded_content = download.content.decode('utf-8')
        reader = csv.reader(decoded_content.splitlines())
        next(reader)
        for row in reader:
            data_list.append(row)
    np_data_list = np.array(data_list)
    search = np.where(np_data_list[:, 1] == "Idaho")
    return (np_data_list[search])

start = time.time()
time_search_np_data()
print("Time consumed in working: ",time.time() - start)



# # importing the required module
# import timeit

# # code snippet to be executed only once
# mysetup = "from math import sqrt"

# # code snippet whose execution time is to be measured
# mycode = '''
# def example():
#     mylist = []
#     for x in range(100):
#         mylist.append(sqrt(x))
# '''

# # timeit statement
# print (timeit.timeit(setup = mysetup,
#                      stmt = mycode,
#                      number = 10000))
# print my
