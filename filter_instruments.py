import json

# Specify all the files from which we extract data, assume that we're in the right working directory
filepaths = ['./A_people.json', './B_people.json', './C_people.json', './D_people.json', './E_people.json', './F_people.json', './G_people.json', './H_people.json', './I_people.json', './J_people.json', './K_people.json', './L_people.json', './M_people.json', './N_people.json', './O_people.json', './P_people.json', './Q_people.json', './R_people.json', './S_people.json', './T_people.json', './U_people.json', './V_people.json', './W_people.json', './X_people.json', './Y_people.json', './Z_people.json']                                             


# Loop over all files
for file in filepaths:

    # Open the current file
    with open(file, encoding='utf-8') as file:
        data = json.load(file)

    # Store the entries that are extracting
    output = []

    # Loop over all the entries in the current file
    for entry in data:

        # If both the instrument label and birthdate are present in the entry, extract the entry
        if 'ontology/instrument_label' in entry and 'ontology/birthDate' in entry:
            output.append(entry)

    # Write the list that contains the filtered entries to a json file
    with open('instrumentPeople.json', 'a', encoding='utf-8') as file:
        json.dump(output, file, indent= 4)
    