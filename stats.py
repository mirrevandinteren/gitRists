
import json
from csv import DictReader
import csv


# Load the filtered data   
with open('clean_data.csv', encoding='utf-8') as file:
    reader=DictReader(file)
    csv_data = list(reader)


# Fields
fields = ['instrument_label', 'decade', 'birthYear', 'genre_label', 'pop_music', 'classical_music']

# Loop over all the musicians
for musician in csv_data:

    # Change the instrument label to piano if piano is present at all
    if 'piano' in musician['instrument_label']:
        musician['instrument_label'] = 'piano'

    # If pop or classical music, add columns with True or False
    if 'pop' in musician['genre_label']:
        musician['pop_music'] = True
    else:
        musician['pop_music'] = False

    if 'classical' in musician['genre_label']:
        musician['classical_music'] = True
    else:
        musician['classical_music'] = False
    

    


# now that the instrument is changed to piano, export to csv file to be handled in R

with open('piano_instrument.csv', 'w', encoding= 'utf-8') as csv_file:
    writer = csv.writer(csv_file, delimiter=',')
    writer.writerow(fields)
    for row in csv_data:
        writer.writerow([row[field] for field in fields])


