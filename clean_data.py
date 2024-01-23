import json
import csv
from csv import DictReader

with open("bigdata.json", encoding='utf-8') as file:
    clean_data = json.load(file)


# Extract the fields for the CSV file
fields = ['ontology/instrument_label', 'ontology/birthDate']

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

# Remove upper cases for intruments
for entry in csv_data:
    entry['ontology/instrument_label']=entry['ontology/instrument_label'].lower()

print(csv_data)