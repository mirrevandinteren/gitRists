import json
import csv
from csv import DictReader

with open("bigdata.json", encoding='utf-8') as file:
    clean_data = json.load(file)

# Add a new row birthYear derived from ontology/birthDate
for item in clean_data:
    if type(item['ontology/birthDate'])!=list:
        numbers=item['ontology/birthDate'].split("-")
        item['birthYear']=numbers[0]

# Extract the fields for the CSV file
fields = ['ontology/instrument_label', 'birthYear', 'ontology/birthDate', 'ontology/birthYear', 'ontology/birthPlace', 'ontology/birthPlace_label' 'ontology/genre_label', 'ontology/genre', 
          'ontology/country', 'ontology/country_label']

# Add missings as NA
for item in clean_data:
    for field in fields:
        if field not in item:
            item[field]='NA'
        if field in item:
            item[field]=item[field]

# Create a new CSV
with open('clean_data.csv', 'w', encoding= 'utf-8') as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(fields)
    for row in clean_data:
        writer.writerow([row[field] for field in fields])

# Clean the data

# Open the newly created CSV file     
with open('clean_data.csv', encoding='utf-8') as file:
    reader=DictReader(file)
    csv_data = list(reader)

# Remove upper cases 
for entry in csv_data:
    for key in entry:
        entry[key]=entry[key].lower()

print(csv_data)