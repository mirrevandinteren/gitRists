
import json
from csv import DictReader
import csv


# Load the filtered data   
with open('clean_data.csv', encoding='utf-8') as file:
    reader=DictReader(file)
    csv_data = list(reader)


# Fields
fields = ['instrument_label', 'decade', 'five_year_bracket', 'birthYear', 'genre_label']

 
# Create a dictionary of which the keys are the decades
# The values are all the instrument counters for that decade
dict_of_dicts = {}

# Loop over all the musicians
for musician in csv_data:

    # Exctract the decade, it comes up often after this point so exctracting explicitly makes sense.
    decade = musician['decade']
    five_year = musician['five_year_bracket']

    # If this is the first time this decade is iterated, create a dictionary within the storing dictionary for this decade
    # All the counters are already present and set to zero, later values are added to these.
    if musician['five_year_bracket'] not in dict_of_dicts:
        dict_of_dicts[five_year] = {'pop_pianists'      : 0, 
                                 'classical_pianists'   : 0,
                                 'jazz_pianists'        : 0,
                                 'rock_pianists'        : 0,
                                 'total_musicians'      : 0,
                                 'total_pianists'       : 0,
                                 'jazz_musicians'       : 0,
                                 'classical_musicians'  : 0,
                                 'pop_musicians'        : 0,
                                 'rock_musicians'       : 0,
                                 'total_guitarists'     : 0,
                                 'jazz_guitarists'      : 0,
                                 'classical_guitarists' : 0,
                                 'pop_guitarists'       : 0,
                                 'rock_guitarists'      : 0,
                                 'decade'               : decade,
                                 'five_year_bracket'    : musician['five_year_bracket']}

    # Do a lot of counting, variable names speak for themselves.
        
    dict_of_dicts[five_year]['total_musicians'] += 1

    if 'piano' in musician['instrument_label']:
        dict_of_dicts[five_year]['total_pianists'] += 1
    
        if 'pop' in musician['genre_label']:
            dict_of_dicts[five_year]['pop_pianists'] += 1

        if musician['genre_label'] == 'classical_music' or musician['genre_label'] == 'classical music':
            dict_of_dicts[five_year]['classical_pianists'] += 1

        if 'jazz' in musician['genre_label']:
            dict_of_dicts[five_year]['jazz_pianists'] += 1

        if 'rock' in musician['genre_label']:
            dict_of_dicts[five_year]['rock_pianists'] += 1

    if 'guitar' in musician['instrument_label']:
        dict_of_dicts[five_year]['total_guitarists'] += 1
    
        if 'pop' in musician['genre_label']:
            dict_of_dicts[five_year]['pop_guitarists'] += 1

        if musician['genre_label'] == 'classical_music' or musician['genre_label'] == 'classical music':
            dict_of_dicts[five_year]['classical_guitarists'] += 1

        if 'jazz' in musician['genre_label']:
            dict_of_dicts[five_year]['jazz_guitarists'] += 1

        if 'rock' in musician['genre_label']:
            dict_of_dicts[five_year]['rock_guitarists'] += 1


    if 'jazz' in musician['genre_label']:
        dict_of_dicts[five_year]['jazz_musicians'] += 1

    if musician['genre_label'] == 'classical_music' or musician['genre_label'] == 'classical music':
        dict_of_dicts[five_year]['classical_musicians'] += 1

    if 'pop' in musician['genre_label']:
        dict_of_dicts[five_year]['pop_musicians'] += 1
    
    if 'rock' in musician['genre_label']:
            dict_of_dicts[five_year]['rock_musicians'] += 1


# Create a list that contains dictionaries as elements, the elements are the values of the storing dictionary
list_of_dicts = list(dict_of_dicts.values())


# Open a file in write mode.
with open('genre_counter.csv', 'w') as f:
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

