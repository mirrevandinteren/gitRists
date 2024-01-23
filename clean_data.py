import json
import csv
from csv import DictReader


# Load the data
with open("bigdata.json", encoding='utf-8') as file:
    clean_data = json.load(file)


# Add a new column birthYear derived from ontology/birthDate, and a column for the decade
for item in clean_data:
    if type(item['ontology/birthDate'])!=list:
        year, month, day = item['ontology/birthDate'].split("-")
        item['birthYear']= year
        # replace the last number of the birthyear by a 0
        decade = year[:3]
        item['decade'] = decade + '0'

# Extract the fields for the CSV file
fields_old = ['ontology/instrument_label', 'decade', 'birthYear', 'ontology/genre_label']

fields_new = ['instrument_label', 'decade', 'birthYear', 'genre_label']



# Add missings as NA and remove uppercases
for item in clean_data:
    for index, field in enumerate(fields_old):
        if field not in item:
            item[field]='NA'
        if field in item:
            item[fields_new[index]]=item.pop(fields_old[index])


# Create a new CSV
with open('clean_data.csv', 'w', encoding= 'utf-8') as csv_file:
    writer = csv.writer(csv_file, delimiter=',')
    writer.writerow(fields_new)
    for row in clean_data:
        writer.writerow([row[field] for field in fields_new])

# Clean the data

# Open the newly created CSV file     
with open('clean_data.csv', encoding='utf-8') as file:
    reader=DictReader(file)
    csv_data = list(reader)

# Remove upper cases 
for entry in csv_data:
    for key in entry:
        entry[key]=entry[key].lower()

# Write lowercased version to csv
        
with open('clean_data.csv', 'w', encoding= 'utf-8') as csv_file:
    writer = csv.writer(csv_file, delimiter=',')
    writer.writerow(fields_new)
    for row in csv_data:
        writer.writerow([row[field] for field in fields_new])
