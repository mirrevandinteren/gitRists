
import json
from csv import DictReader
import csv


# Load the filtered data   
with open('clean_data.csv', encoding='utf-8') as file:
    reader=DictReader(file)
    csv_data = list(reader)


# Fields
fields = ['instrument_label', 'decade', 'birthYear', 'genre_label']

# Loop over all the musicians
for musician in csv_data:
    if 'piano' in musician['instrument_label']:
        musician['instrument_label'] = 'piano'


# now that the instrument is changed to piano, export to csv file to be handled in R

with open('piano_instrument.csv', 'w', encoding= 'utf-8') as csv_file:
    writer = csv.writer(csv_file, delimiter=',')
    writer.writerow(fields)
    for row in csv_data:
        writer.writerow([row[field] for field in fields])


