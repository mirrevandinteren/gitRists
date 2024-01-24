
import json
from csv import DictReader
import csv


# Load the filtered data   
with open('clean_data.csv', encoding='utf-8') as file:
    reader=DictReader(file)
    csv_data = list(reader)


# Fields
fields = ['instrument_label', 'decade', 'birthYear', 'genre_label', 'genre']

# Loop over all the musicians
for musician in csv_data:

    # Change the instrument label to piano if piano is present at all
    if 'piano' in musician['instrument_label']:
        musician['instrument_label'] = 'piano'

    # If pop or classical music, add columns with True or False
    if 'pop' in musician['genre_label'] and 'classical' in musician['genre_label']:
        musician['genre'] = ['pop', 'classical']
    
    elif 'pop' in musician['genre_label'] and 'classical' not in musician['genre_label']:
        musician['genre'] = 'pop'

    elif 'classical' in musician['genre_label'] and 'pop' not in musician['genre_label']:
        musician['genre'] = 'classical'
    
    else:
        musician['genre'] = 'other'

   

list_of_dicts = {}

for musician in csv_data:

    decade = musician['decade']
    if musician['decade'] not in list_of_dicts:
        list_of_dicts[decade] = {'pop_pianists'         : 0, 
                                 'classical_pianists'   : 0,
                                 'total_musicians'      : 0,
                                 'total_pianists'       : 0,
                                 'decade'               : decade}

    list_of_dicts[decade]['total_musicians'] += 1

    if 'piano' in musician['instrument_label']:
        list_of_dicts[decade]['total_pianists'] += 1
    
        if 'pop' in musician['genre_label']:
            list_of_dicts[decade]['pop_pianists'] += 1

        elif 'classical' in musician['genre_label']:
            list_of_dicts[decade]['classical_pianists'] += 1


list_of_dicts = list(list_of_dicts.values())


# Open a file in write mode.
with open('piano_genre_counter.csv', 'w') as f:
    # Write all the dictionary keys in a file with commas separated.
    f.write(','.join(list_of_dicts[0].keys()))
    f.write('\n') # Add a new line
    for row in list_of_dicts:
        # Write the values in a row.
        f.write(','.join(str(x) for x in row.values()))
        f.write('\n') # Add a new line


# now that the instrument is changed to piano, export to csv file to be handled in R

with open('piano_instrument.csv', 'w', encoding= 'utf-8') as csv_file:
    writer = csv.writer(csv_file, delimiter=',')
    writer.writerow(fields)
    for row in csv_data:
        writer.writerow([row[field] for field in fields])


