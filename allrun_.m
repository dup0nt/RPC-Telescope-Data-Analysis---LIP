
%% 1.downloads dos files

%Loader de Valores de Pasta
clear all, close all


filenames = string(importdata('.\HV_Scan\helper.txt'));

%% 2.script para organizar os ficheiros


clc

%
for file = filenames

var(find(file==filenames)).num = find(file==filenames);       %numero do evento
var(find(file==filenames)).name = file;                       %nome do evento
var(find(file==filenames)).events = num_of_events(file);      %numero de eventos selecionados
                                                              %alterar esta
                                                              %função como
                                                              %filtro
var(find(file==filenames)).medpos  = sum(dist(file))/length(dist(file)); %media das distâncias 
var(find(file==filenames)).maxpos = max(dist(file));                     %dist media
[year,month,day] = monthday(file);
var(find(file==filenames)).year = year;     %year
var(find(file==filenames)).month= month;    %month 
var(find(file==filenames)).day = day;       %event day



% 
% if var(find(file==filenames)).events>50
%          var(find(file==filenames)).quality=1;
% else
%     var(find(file==filenames)).quality=0;
% end


%var(find()file==filename)).dist   = 
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


Theta1 = [];phi1 =[];
for i = filenames
    
    [Theta,phi]=Plot_Angle_Dist_function(i) 
    Theta1=[Theta1 ;Theta];disp(length(Theta1))
    phi1= [phi1 phi];disp(length(phi1)) 
    
    
end

sphplot(phi1,Theta1+pi/2)

