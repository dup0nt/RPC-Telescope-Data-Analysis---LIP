
%% 1.downloads dos files

%Loader de Valores de Pasta
clear all, close all

pathe = ".\HV_Scan\";
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

%% criar tabela de seleção


matrix = []
for i =  length(filenames) 
new_matrix = [var(i).name var(i).num var(i).events var(i).medpos var(i).maxpos] 
matrix = [matrix ; new_matrix];
end

%% 3. seleccionar os ficheiros que queremos

%event_sorted = zeros(length(var));

event_sorted = [];     %vetor que guarda os eventos 
for i = 1:length(var)
    
    if var(i).events>50   % filtro selectro de eventos
        event_sorted = [event_sorted var(i).name ] ; 
    end
    
    
    
end


%% 3.chamar cada file nas funções

filenames = event_sorted;
theta1 = [];phi1 =[];dist1=[];

for num = 1:length(filenames)
file = filenames(num);

    [theta,phi,dist] = Plot_Angle_Dist_Simple_function(pathe,file);  %[theta,phi,pos] = output
    theta1=[theta1 theta];	%disp(length(theta1));
    phi1= [phi1 phi];		%disp(length(phi1));
    dist1= [dist1 dist];
	
end

%sphplot(phi1,Theta1+pi/2)
%hist(dist)
