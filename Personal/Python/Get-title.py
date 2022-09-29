from email.message import _PayloadType
import requests

url = "https://imdb8.p.rapidapi.com/title/get-seasons"

querystring = {"tconst":"tt2098220"}

headers = {
    'x-rapidapi-host': "imdb8.p.rapidapi.com",
    'x-rapidapi-key': "682b5985b8msh790c120c551f8cap11a7e6jsnb229edb4bf6a"
    }
url = r"C:\Users\Shane\OneDrive\Documents\Code\Python"
response = requests.request("GET", url, headers=headers, params=querystring)
print(response)
print(response.json())


