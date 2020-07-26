function eff = efficiencia1_2_4(save)

load(('.\HV_Scan\' + save))

I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1; EventM1 = sum(M1');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1; EventM2 = sum(M2');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1; EventM3 = sum(M3');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1; EventM4 = sum(M4');

I = find(EventM1 > 1 & EventM4 > 1 & EventM2 > 1);


eff = length(find(EventM3(I)))/length(I);

end