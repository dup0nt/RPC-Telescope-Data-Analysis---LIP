% Para o intervalo Q4 variavel
clear all
set(0,'DefaultFigureWindowStyle','docked')

eficiencia = [];

for a = 1:31
	b = 64 - a + 1;
	
	eficiencia =  [eficiencia efficiencia_variavel(a,b)];
	abertura(a) = abs(a-b);
end

stem(abertura,eficiencia);

ylabel('Eficiência');
xlabel('Abertuda');


	
	