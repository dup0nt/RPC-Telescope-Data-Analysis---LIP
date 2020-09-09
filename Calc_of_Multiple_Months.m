clear all, close all;

pathe = ".\data_jul\";
filenames = string(importdata(pathe + 'helper.txt'));


data_jul = [];
data_aug = [];
tic
for i=1:length(filenames)
	data_jul(i) = efficiencia1_2_3(pathe,filenames(i));
end
toc

pathe = ".\data_aug\";
filenames = string(importdata(pathe + 'helper.txt'));
tic
for i=1:length(filenames)
	data_aug(i) = efficiencia1_2_3(pathe,filenames(i));
end
toc

hold on
scatter(1:1618, data_jul,'r')
scatter(1619:2246+1618, data_aug,'o')