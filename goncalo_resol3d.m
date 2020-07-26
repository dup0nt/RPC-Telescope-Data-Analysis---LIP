
clc;clf;clear all;close all 

set(0,'DefaultFigureWindowStyle','docked')
 

load('HV_Scan\20200406105251_5980V.mat');
format short


I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1;EventM1 = sum(M1.');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1;EventM2 = sum(M2.');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1;EventM3 = sum(M3.');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1;EventM4 = sum(M4.');

found= find(EventM1 == 1 & EventM3 == 1 & EventM2==1);

imgzposition_1 = 0;
imgzposition_2 = 145/43;% são dos gaps de 145 cm
imgzposition_3 = 2*imgzposition_2;

x = 0:7;y = x;
min_x = min(min(x));min_y = min(min(y));
max_x = max(max(x));max_y = max(max(y));

figure;colormap parula(5)

x_map= 1.5:1:6.5;
y_map= 1.5:1:6.5;
z_map3= imgzposition_3*ones(1,length(x_map));
z_map2= imgzposition_2*ones(1,length(x_map));
z_map1= zeros(1,length(x_map));

count = 0;Theta =[];dist = [];

n = [0 0 1];

for i = found
    count = count+1;
    hold on
    new_1 = M1(i, :);
    new_1 = reshape(new_1,7,7)';
    
    new_2 = M1(i, :);
    new_2 = reshape(new_1,7,7);
    
    new_3 = M3(i, :);
    new_3 = reshape(new_3,7,7)';
    
     surf([min_x max_x],[min_y max_y],repmat(imgzposition_1, [2 2]),...
     new_1','facecolor','texture')
%    
             surf([min_x max_x],[min_y max_y],repmat(imgzposition_2, [2 2]),...
     new_2','facecolor','texture')
%        
    surf([min_x max_x],[min_y max_y],repmat(imgzposition_3, [2 2]),...
    new_3','facecolor','texture')
%        
     legend(strcat("counter = ",num2str(count,'%-6.3f')))
    title(strcat("trigger = ",num2str(i,'%-6.3f')))
     view(45,20);  
    
    
    
    [x1,y1]= find(new_1==1);[x2,y2]= find(new_2==1);[x3,y3]= find(new_3==1);
    
    v1 =[x1-0.5,y1-0.5,0]; 
    v2 = [x3-0.5,y3-0.5,imgzposition_3];
   
    LineExtrapolation3D(v2,v1,imgzposition_3) 
    
    v = v2-v1;
    Theta = [Theta atan2(norm(cross(v,n)), dot(v,n)).*(180/pi)];
    
    pontos = interception_plane(v1,v2,imgzposition_2);
    scatter3(pontos(1), pontos(2),imgzposition_2,"filled") 
    scatter3(x2-0.5, y2-0.5,imgzposition_2,imgzposition_2,"filled") 
    dist = [dist double(norm([x2-0.5 y2-0.5]-[pontos(1) pontos(2)])) ]
    pause()
    clf
    hold off
end



%%



tic 

clc;clf;clear all;close all

set(0,'DefaultFigureWindowStyle','docked')


load('HV_Scan\20200406105251_5980V.mat');
format short


I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1;EventM1 = sum(M1.');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1;EventM2 = sum(M2.');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1;EventM3 = sum(M3.');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1;EventM4 = sum(M4.');

found= find(EventM1 == 1 & EventM3 == 1 & EventM2==1);

imgzposition_1 = 0;
imgzposition_2 = 145/43;% são dos gaps de 145 cm
imgzposition_3 = 2*imgzposition_2;

x = 0:7;y = x;
min_x = min(min(x));min_y = min(min(y));
max_x = max(max(x));max_y = max(max(y));

figure;colormap parula(5)

x_map= 1.5:1:6.5;
y_map= 1.5:1:6.5;
z_map3= imgzposition_3*ones(1,length(x_map));
z_map2= imgzposition_2*ones(1,length(x_map));
z_map1= zeros(1,length(x_map));

count = 0;Theta =[];dist = [];phi = [];

n = [0 0 1];

for i = found
    count = count+1;
    hold on
    new_1 = M1(i, :);
    new_1 = reshape(new_1,7,7)';
    
    new_2 = M1(i, :);
    new_2 = reshape(new_1,7,7);
    
    new_3 = M3(i, :);
    new_3 = reshape(new_3,7,7)';
    
    
    [x1,y1]= find(new_1==1);[x2,y2]= find(new_2==1);[x3,y3]= find(new_3==1);
    
    v1 =[x1-0.5,y1-0.5,0];
    v2 = [x3-0.5,y3-0.5,imgzposition_3];
    
    v = v2-v1;
    Theta = [Theta atan2(norm(cross(v,n)), dot(v,n)).*(180/pi)];
    
    pontos = interception_plane(v1,v2,imgzposition_2);
    
    dist = [dist double(norm([x2-0.5 y2-0.5]-[pontos(1) pontos(2)])) ];
    phi(count) = cart2pol(v(:,1),v(:,2),v(:,3));
    
    
    
end


disp(mean(dist))
hist(dist,length(unique(dist)));xline(mean(dist),"r","filled")
figure
hist(Theta,length(unique(Theta)));
xlabel("angle between vector and XoY normal vector")
ylabel("number of events")
figure
hist((phi*180/pi+160),length(unique(phi)));
xlabel("azimuthal angle")
ylabel("number of events");xlim([0 350]);


 toc

 %% 
 
 [x,y,z] = sphere; 
x = x(11:end,:);
y = y(11:end,:); 
z = z(11:end,:);
r = 1; 
surf(r.*x,r.*y,r.*z,'FaceColor','yellow','FaceAlpha',0.2); 
axis equal;xlabel("X");ylabel("Y");zlabel("Z");
hold on

base = zeros(100,100);
for i = 1:85

    xcart = 0;ycart=0;zcart=0;
    [xcart,ycart,zcart] = sph2cart(phi(i),Theta(i),1);
	scatter3(xcart,ycart,abs(zcart),"filled")	
	surf(base)
	view(0,90)
end





