with open("D:/College/Cellular Automata_PRNG/Tabular List/Null","r") as file:
    binarydata=file.read()
    datas=binarydata.split("\n")
    datas.pop(len(datas)-1)
    binarydata_16bit=[]
    for data in datas:
        data_1=[]
        data_1=data.split("+0")
        binarystring=data_1[1].strip()
        binarydata_16bit.append(binarystring)    
string=""
for binarydata in binarydata_16bit:
    string=string+binarydata

with open("D:/College/Cellular Automata_PRNG/Text File/Null.txt","w") as file:
    file.write(string)