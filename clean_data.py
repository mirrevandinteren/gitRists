import json
import csv
from csv import DictReader


# Load the data
with open("bigdata.json", encoding='utf-8') as file:
    clean_data = json.load(file)



for item in clean_data.copy():
    # Find the birthdate of a musician and store it in year, month, day variables. 
    # This is handled differently if there's a list of birthdates, then the first birthday is used.
    if type(item['ontology/birthDate']) != list:
        year, month, day = item['ontology/birthDate'].split("-")
    elif type(item['ontology/birthDate']) == list:
        year, month, day = item['ontology/birthDate'][0].split("-")
    
    # Add the columns birthYear and decade to the data, and select the musicians born after 1800.
    # The decade is found by changing the last character of the string to a 0
    if int(year) >= 1800:
        item['birthYear']= year
        # replace the last number of the birthyear by a 0
        decade = year[0:3]
        item['decade'] = decade + '0'
    else:
        clean_data.pop(clean_data.index(item))



# The old fields are the colums of interest, the new fields are their renamed versions.
fields_old = ['ontology/instrument_label', 'decade', 'birthYear', 'ontology/genre_label']
fields_new = ['instrument_label', 'decade', 'birthYear', 'genre_label']



# Rename the columns
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
