clear all, close all
set(0,'DefaultFigureWindowStyle','docked')
%dir('C:\Users\ASUS\OneDrive - Universidade de Coimbra\Faculdade do Diogo\2 ano\Estágio\HV_Scan')
%system('helper.py')

data = importdata('.\HV_Scan\helper.txt');

eficiencias1_2_4 = [];
eficiencias1_3 = [];
eficiencias1_3_4 = [];
eficiencias1_3_4_wpads = [];


for i = 1:length(data)-1
	info = data(i);
	info = string(info);
	
	%Separacao dos nomes nas abcissas
    p = split(info, "_"); p=p(2);	
    p = split(p, "V"); p=p(1);		
	V(i) = double(p);				
	
	eficiencias1_2_4 = [eficiencias1_2_4 efficiencia1_2_4(info)];
	eficiencias1_3 = [eficiencias1_3 efficiencia1_3(info)];
	eficiencias1_3_4 = [eficiencias1_3_4 efficiencia1_3_4(info)];
	eficiencias1_3_4_wpads = [eficiencias1_3_4_wpads efficiencia1_3_4_wpads(info)];
end

hold on;

%scatter(V, eficiencias1_2_4,'m','filled');
%scatter(V, eficiencias1_3, 'b','filled');
scatter(V, eficiencias1_3_4,'g','filled'); %legend('Eff 1-2-4','Eff 1-3','Eff 1-3-4');
scatter(V ,eficiencias1_3_4_wpads,'g');
xlabel('Volts'); title('Gráf. Eficiências em Func Volts');


set(0,'DefaultFigureWindowStyle','normal')





