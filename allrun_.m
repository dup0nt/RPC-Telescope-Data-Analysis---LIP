
%% 1.downloads dos files

%Loader de Valores de Pasta
clear all, close all

<<<<<<< HEAD
filenames = string(importdata('.\Scans_Cloud\helper.txt'))';
filenames = filenames(1:4);
=======
>>>>>>> parent of f766a1e... Data Sheets Update

filenames = string(importdata('.\HV_Scan\helper.txt'));




<<<<<<< HEAD




=======
>>>>>>> parent of f766a1e... Data Sheets Update
%% 2.script para organizar os ficheiros


clc

%"[numero do evento    file   numero_de_eventos outlayers distancia_média  ]"
for file = filenames

var(find(file==filenames)).num = find(file==filenames);  
var(find(file==filenames)).name = file;
var(find(file==filenames)).events = num_of_events(file);




if var(find(file==filenames)).events>50
         var(find(file==filenames)).quality=1;
else
    var(find(file==filenames)).quality=0;
end


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
	
    [Theta,phi, pos] = Plot_Angle_Dist_Simple_function(i);
    
    
    Theta1=[Theta1 Theta];disp(length(Theta1))
    phi1= [phi1 phi];disp(length(phi1)) 
    
    
end

sphplot(Theta1+pi/2,phi1)

