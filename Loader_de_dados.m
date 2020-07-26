%Loader de Valores de Pasta
clear all, close all


data = importdata('.\HV_Scan\helper.txt');

ficheiro = 1 ;%input(sprintf('Selecione 1 a %.0f: ',length(data)));

save = data(ficheiro);
save = string(save);

load(('.\HV_Scan\' + save))