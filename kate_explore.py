import json
import csv

with open("instrumentPeople.json", encoding = 'utf-8') as file: 
    data = json.load(file)


fields = ['ontology/birthDate', 'ontology/instrument_label']
with open('instrument_people.csv', 'w', newline = '', encoding = 'utf-8') as csv_file:
    writer = csv.DictWriter(csv_file, fieldnames=fields)
    writer.writerows(data)
