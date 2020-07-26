clc; clear all

Vloads = ["20200406105251_5980V.mat","20200407102947_6180V.mat",...
    "20200407230718_5850V.mat","20200408101601_5750V.mat","20200408235835_5650V.mat",...
    "20200409105410_5550V.mat","20200410123312_5450V.mat","20200411153503_5350V.mat",...
    "20200413121523_5250V.mat","20200413235709_5150V.mat","20200414110341_5050V.mat","20200415150034_4950V.mat",...
    "20200416124233_4850V.mat","20200417125548_4750V.mat"];

%para simplificar com muitos documentos
%Vloads = dir('*.mat');

V = zeros(1,length(Vloads));eff=V;

for i = Vloads
    n = find(Vloads ==i)  ;
    p= split(i,"_");p=p(2) ;
    p= split(p,"V");p=p(1);
    V(n)= double(p);

    load(i)     %Q1 Q2 Q3 são listas com os valores das respetivas placas
    M1 = Q1>0;I = find(M1);EventM1 = sum(M1.');
    M2 = Q2>0;I = find(M2); EventM2 = sum(M2.');
    M3 = Q3>0;I = find(M3);EventM3 = sum(M3.');
    M4 = Q4>0;I = find(M4); EventM4 = sum(M4.');
    I= find(EventM1 > 1 & EventM3 > 1);
    eff(i) = length(find(EventM2(I)))/length(I);
end



stem(V,eff);grid on
ylim([0 1]);title("eficiência em função de dpp entre placas")
xlabel("V");ylabel("eficiência")


