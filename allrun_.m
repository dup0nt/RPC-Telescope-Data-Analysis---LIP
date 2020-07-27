
%% 1.downloads dos files

filenames = ["20200406105251_5980V.mat","20200407102947_6180V.mat"...
    "20200407230718_5850V.mat","20200408101601_5750V.mat","20200408235835_5650V.mat",...
    "20200409105410_5550V.mat","20200410123312_5450V.mat","20200411153503_5350V.mat",...
    "20200413121523_5250V.mat","20200413235709_5150V.mat","20200414110341_5050V.mat","20200415150034_4950V.mat",...
    "20200416124233_4850V.mat","20200417125548_4750V.mat"];

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

%% salvar codigo a cada  500 trig´ 
%[numero do evento    file   numero_de_eventos outlayers distancia_média  ]
counter =0;
if length(".............")==500     %dar save de 500 em 500 saves
   
    counter = counter+1
    
    %escrever aqui as variaveis
    T = table(A, B, 'VariableNames', { 'event', 'file_name','positive_events',"outlayers", "dist_media"} );
    
    name= strcat("Myfile",num2str(counter))
    writetable(T, name)

end

%% 4.chamar cada file nas funções




Theta1 = [];phi1 =[];
for i = filenames
    [Theta,phi]=Plot_Angle_Dist_function(i)  
    Theta1=[Theta1 Theta];disp(length(Theta1))
    phi1= [phi1 phi];disp(length(phi1))
    
    
    
    
    
end
sphplot(phi1,Theta1+pi/2)

