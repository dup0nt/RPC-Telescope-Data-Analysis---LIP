
%% 1.downloads dos files

%Loader de Valores de Pasta
clear all, close all


pathe = ".\data_aug\";
filenames = string(importdata(pathe + 'helper.txt'));

%% 2.script para organizar os ficheiros


clc

%
for num = 1:length(filenames)

file = filenames(num);

var(find(file==filenames)).num = find(file==filenames);       %numero do evento
var(find(file==filenames)).name = file;                       %nome do evento
var(find(file==filenames)).events = num_of_events(pathe,file);      %numero de eventos selecionados
                                                              %alterar esta
                                                              %função como
                                                              %filtro
% var(find(file==filenames)).medpos  = sum(dist_pos(path,file))/length(dist_pos(path,file)); %media das distâncias 
% var(find(file==filenames)).maxpos = max(dist_pos(path,file));                     %dist media
[year,month,day] = monthday(file);
var(find(file==filenames)).year = year;     %year
var(find(file==filenames)).month= month;    %month 
var(find(file==filenames)).day = day;       %event day

end

%% 3. criar tabela de seleção
% 
% 
% matrix = []
% for i =  length(filenames) 
% new_matrix = [var(i).name var(i).num var(i).events var(i).medpos var(i).maxpos] 
% matrix = [matrix ; new_matrix];
% end

%% 3. seleccionar os ficheiros que queremos

%event_sorted = zeros(length(var));

% event_sorted = [];     %vetor que guarda os eventos 
% for i = 1:length(var)
%     
%     if var(i).events>50   % filtro selectro de eventos
%         event_sorted(i)= var(i).name; 
%     end
%     
%     
%     
% end


%% 4.chamar cada file nas funções

%filenames = event_sorted;
all_thetas = []; all_phis =[]; all_dist = [];

for num = 1:length(filenames)
file = filenames(num);

[theta,phi,dist] = Plot_Angle_Dist_Simple_function(pathe,file);			%[theta,phi,pos] = output

all_thetas{num} = theta;
all_phis{num} = phi;
all_dist{num} = dist;

end
if (pathe)==".\data_jul\"
dlmwrite('all_phis_JUL.txt',cell2mat(all_phis))
dlmwrite('all_thetas_JUL.txt',cell2mat(all_thetas))
elseif (pathe)==".\data_aug\"
dlmwrite('all_phis_AUG.txt',cell2mat(all_phis))
dlmwrite('all_thetas_AUG.txt',cell2mat(all_thetas))
end
	
%test = rand([1 10000000])*pi-pi; dlmwrite('all_thetas_RAND.txt',(test))
%test = rand([1 10000000])*2*pi-pi; dlmwrite('all_phis_RAND.txt',(test))

%% 5
% close all
% hold on
% view(0,90)
% count = 0;
% modular = 1;
% 
% for i = 1:length(filenames)
% 	
% 	sphplot(all_thetas{i}+pi/2,all_phis{i});
% 	
% 	if mod(i,modular)==0 || i == length(filenames)
% 		print(gcf,genvarname(['figure_' var(i).month '_' num2str(i/modular)]),'-dpng','-r1000')
% 		
% 	end		
% end
% 
% hold off
%dlmwrite('all_phis_JUL.txt',cell2mat(all_phis))

%% 5. fazer os plot mensais
% 
% month = "04"
% 
% %procurar files
% ficheiros = find(var.month==month)  %procura quais os indices de cada file do Mês
% 
% for i = ficheiros
%     
%     matrix = [var(i).day;...
%         var(i).num_of_events...
%         ]
%     
% end
% 
% subplot 211
% 
% plot(matrix(1,:),matrix(2,:),'-s','MarkerSize',10,...
%     'MarkerEdgeColor','red',...
%     'MarkerFaceColor',[1 .6 .6])
% 

