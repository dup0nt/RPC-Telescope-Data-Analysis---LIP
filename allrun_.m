
%% 1.downloads dos files

%Loader de Valores de Pasta
clear all, close all


data = importdata('.\HV_Scan\helper.txt');

ficheiro = 1 ;%input(sprintf('Selecione 1 a %.0f: ',length(data)));

save = data(ficheiro);
save = string(save);

filenames=load(('.\HV_Scan\' + save))


%% 2.script para organizar os ficheiros


clc

%"[numero do evento    file   numero_de_eventos outlayers distancia_m�dia  ]"
for file = "20200406105251_5980V"
%[Theta,phi]=Plot_Angle_Dist_function(file) 
var(find(file==filenames)).num = find(file==filenames);  
var(find(file==filenames)).name = file;
var(find(file==filenames)).events = num_of_events(file);
var(find(file==filenames)).Theta = Theta



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


%% 3.chamar cada file nas fun��es




Theta1 = [];phi1 =[];
for i = filenames
    [Theta,phi]=Plot_Angle_Dist_function(i) 
    
    
    Theta1=[Theta1 ;Theta];disp(length(Theta1))
    phi1= [phi1 phi];disp(length(phi1)) 
    
    
end
sphplot(phi1,Theta1+pi/2)

