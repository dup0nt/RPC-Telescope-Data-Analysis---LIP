function eff = efficiencia_variavel(a,b)

%a & b are defined as the limits for the interval where we want to observe
%the presence of muons
data = importdata('.\HV_Scan\helper.txt');

ficheiro = 1;

save = data(ficheiro);
save = string(save);

load(('.\HV_Scan\' + save))

I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1; EventM1 = sum(M1');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1; EventM2 = sum(M2');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1; EventM3 = sum(M3');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1; EventM4 = sum(M4(:,a:b)');




I = find(EventM1 > 1 & EventM3 > 1 & EventM4 > 1);


eff = length(find(EventM2(I)))/length(I);

end