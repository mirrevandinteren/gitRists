import json
import csv

with open("bigdata.json", encoding='utf-8') as file:
    clean_data = json.load(file)


# Extract the fields for the CSV file
fields = ['ontology/instrument_label', 'ontology/birthDate']

# Open a new CSV
with open('clean_data.csv', 'w') as csv_file:
    writer = csv.writer(csv_file, delimiter=';')
    writer.writerow(fields)
    for row in clean_data:
        writer.writerow([row[field] for field in fields])