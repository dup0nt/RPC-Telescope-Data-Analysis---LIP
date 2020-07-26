import os

path = 'C:\\Users\\ASUS\\OneDrive - Universidade de Coimbra\\Faculdade do Diogo\\2 ano\\Estágio\\HV_Scan'
#path = 'C:\\Users\\ASUS\\Documents'
file_path = os.path.join(path, 'helper.txt')
files=[]
for file in os.listdir(path):
    files+=[file]


f = open(file_path, "w")

for file in files:
    f.write(file + '\n')


f.close()