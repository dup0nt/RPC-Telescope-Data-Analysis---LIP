
%% 1.downloads dos files

%Loader de Valores de Pasta
clear all, close all

path = '.\HV_Scan\';
path = string(path);
filenames = string(importdata(path + 'helper.txt'));


%% 2.script para organizar os ficheiros

clc

%
for num = length(filenames)

file = filenames(num);
load(path, file)
var(find(file==filenames)).num = find(file==filenames);       %numero do evento
var(find(file==filenames)).name = file;                       %nome do evento
var(find(file==filenames)).events = num_of_events(path,file);      %numero de eventos selecionados
                                                              %alterar esta
                                                              %fun��o como
                                                              %filtro
var(find(file==filenames)).medpos  = sum(dist_pos(path,file))/length(dist_pos(path,file)); %media das dist�ncias 
var(find(file==filenames)).maxpos = max(dist(path,file));                     %dist media
[year,month,day] = monthday(file);
var(find(file==filenames)).year = year;     %year
var(find(file==filenames)).month= month;    %month 
var(find(file==filenames)).day = day;       %event day

end

%% criar tabela de sele��o


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


%% 3.chamar cada file nas fun��es


Theta1 = [];phi1 =[];
for i = filenames
    
    [Theta,phi]=Plot_Angle_Dist_function(path,i) 
    Theta1=[Theta1 ;Theta];disp(length(Theta1))
    phi1= [phi1 phi];disp(length(phi1)) 
    
    
end

sphplot(phi1,Theta1+pi/2)

