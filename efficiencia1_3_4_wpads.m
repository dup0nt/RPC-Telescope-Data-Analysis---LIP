function eff = efficiencia1_3_4_wpads(save)

load(('.\HV_Scan\' + save))

I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1; EventM1 = sum(M1');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1; EventM2 = sum(M2');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1; EventM3 = sum(M3');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1; EventM4 = sum(M4');


I = find(Q1o > 0); M1o = Q1o*0; M1o(I) = 1; EventM1o = sum(M1o');
I = find(Q2o > 0); M2o = Q2o*0; M2o(I) = 1; EventM2o = sum(M2o');
I = find(Q3o > 0); M3o = Q3o*0; M3o(I) = 1; EventM3o = sum(M3o');

%I = find((EventM1 > 1 | EventM1o > 1) & (EventM3 > 1 | EventM3o > 1) & EventM4 > 1);
I = find(EventM1 > 1 & EventM3 > 1 & EventM4 > 1);

eff = length(find(EventM2(I) | EventM2o(I)))/length(I);

end