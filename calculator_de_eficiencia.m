clear all, close all

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
scatter(V, eficiencias1_3_4,'b','filled'); %legend('Eff 1-2-4','Eff 1-3','Eff 1-3-4');
scatter(V ,eficiencias1_3_4_wpads,'b');
xlabel('Volts'); title('Gráf. Eficiências em Func Volts'); ylabel('Eficiência');





