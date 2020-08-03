function I = num_of_events(pathe,evento)

load(pathe + evento)     %Q1 Q2 Q3 são listas com os valores das respetivas placas

M1 = Q1>0;I = find(M1);EventM1 = sum(M1.');
M2 = Q2>0;I = find(M2); EventM2 = sum(M2.');
M3 = Q3>0;I = find(M3);EventM3 = sum(M3.');
M4 = Q4>0;I = find(M4); EventM4 = sum(M4.');

I= find(EventM1 == 1 & EventM3 ==1 & EventM2==1);

end

