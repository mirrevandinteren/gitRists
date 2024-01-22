import json


filepaths = ['./A_people.json', './B_people.json', './C_people.json', './D_people.json', './E_people.json', './F_people.json', './G_people.json', './H_people.json', './I_people.json', './J_people.json', './K_people.json', './L_people.json', './M_people.json', './N_people.json', './O_people.json', './P_people.json', './Q_people.json', './R_people.json', './S_people.json', './T_people.json', './U_people.json', './V_people.json', './W_people.json', './X_people.json', './Y_people.json', './Z_people.json']                                             

for file in filepaths:
    with open(file, encoding='utf-8') as file:
        aData = json.load(file)

    output = []

    for entry in aData:
        if 'ontology/instrument_label' in entry and 'ontology/birthDate' in entry:
            output.append(entry)

    with open('instrumentPeople.json', 'a', encoding='utf-8') as file:
        json.dump(output, file, indent= 4)








    













