
'''
Authors: Mirre van Dinteren, Siem Broeder, Blanka Cseres-Gergely, Kate Grossenbacher
Date: 26 January 2024


Description:

This script parses through the People of Wikipedia dataset (2015), and selects the musicians from the list of people.
The musicians are selected based on the 'ontology/instrument_label' to be present, for this research it's essential that a birthdate
is also present. 
The people that pass through this filter are then written to a .json file to be used in analysis later.

'''





import json

# Specify all the files from which we extract data, assume that we're in the right working directory
filepaths = ['./A_people.json', './B_people.json', './C_people.json', './D_people.json', './E_people.json', './F_people.json', './G_people.json', './H_people.json', './I_people.json', './J_people.json', './K_people.json', './L_people.json', './M_people.json', './N_people.json', './O_people.json', './P_people.json', './Q_people.json', './R_people.json', './S_people.json', './T_people.json', './U_people.json', './V_people.json', './W_people.json', './X_people.json', './Y_people.json', './Z_people.json']                                             


# Store the entries from each file in a list
total_output = []


# Loop over all files
for file in filepaths:

    # Open the current file
    with open(file, encoding='utf-8') as file:
        data = json.load(file)

    # Loop over all the entries in the current file
    for entry in data:

        # If both the instrument label and birthdate are present in the entry, extract the entry
        if 'ontology/instrument_label' in entry and 'ontology/birthDate' in entry:
            total_output.append(entry)


# Write the list that contains the filtered entries to a json file
with open('bigdata.json', 'w', encoding='utf-8') as file:
    json.dump(total_output, file, indent = 4)






