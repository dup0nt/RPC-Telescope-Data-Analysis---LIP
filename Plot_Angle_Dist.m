clear all, close all
load('HV_Scan\20200406105251_5980V.mat');
tic

I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1;EventM1 = sum(M1.');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1;EventM2 = sum(M2.');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1;EventM3 = sum(M3.');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1;EventM4 = sum(M4.');

found= find(EventM1 == 1 & EventM3 == 1 & EventM2==1);

imgzposition_1 = 0;
imgzposition_3 = 145*2/43;
imgzposition_2 = imgzposition_3/2;

x = 0:7;
y = x; 

min_x = min(min(x));
min_y = min(min(y));
max_x = max(max(x));
max_y = max(max(y));
 
figure;
colormap summer
index = 0;
theta = [];
pos = [];

posicao_placa = [];
posicao_calc = [];

%largura = 43;		%mm
%espacamento = 7;	%mm

for i = found			%9652
	
	new_1 = M1(i, :);
	new_1 = reshape(new_1,7,7)';
	
	new_3 = M3(i, :);
	new_3 = reshape(new_3,7,7)';
	
	new_2 = M2(i, :);
	new_2 = reshape(new_2,7,7)';
	
	

	%auxiliar 
	
		
	index = index + 1;

	%%%======================= Grafico ================================

	%hold on

	%axis([min_x max_x min_y max_y 0,imgzposition_3]);

% 		surf([min_x max_x],[min_y max_y],repmat(imgzposition_1, [2 2]),...
% 		new_1','facecolor','texture')
% 	
% 		surf([min_x max_x],[min_y max_y],repmat(imgzposition_3/2, [2 2]),...
% 		new_2','facecolor','texture')
% 
% 		surf([min_x max_x],[min_y max_y],repmat(imgzposition_3, [2 2]),...
% 		new_3','facecolor','texture')
% 		
% 		scattergrid(0,imgzposition_3)
	%view(45,20);


	%%%===================== Cálculo Valores ==========================


	[x1,y1] = find(new_1==1);
	[x2,y2] = find(new_2==1);
	[x3,y3] = find(new_3==1);

% 		a = [(x1-1)*43+rand()*38+4,(y1-1)*43+rand()*38+4,0]; 
% 		b = [(x3-1)*43+rand()*38+4,(y3-1)*43+rand()*38+4,imgzposition_3];

	a = [x1-0.5,y1-0.5,0];
	b = [x3-0.5,y3-0.5,imgzposition_3];


	ponto_intersec = reta_intersection(a,b,imgzposition_2);
	ponto_intersec = double(ponto_intersec);
	
	%plot3([a(:,1)'; b(:,1)'],[a(:,2)'; b(:,2)'],[a(:,3)'; b(:,3)'],'.-c','LineWidth',2);
	%hold off

	%clear t x y z
	%Vetor para angulo
	v = b-a;

	theta = [theta,rad2deg(atan2(sqrt(v(1)^2+v(2)^2),v(3)))];

% 	posicao_calc = [posicao_calc ponto_intersec];
% 	posicao_placa = [posicao_placa x2 y2];
	
	%Vetor para distancia
	X1 = x2-0.5-ponto_intersec(1);
	Y1 = y2-0.5-ponto_intersec(2);

	pos = [pos sqrt((X1).^2+(Y1).^2)];
	%legend(['dist = ' num2str(pos(index))]) 

	%%%================ Angle by Spherical Coordinates ================

	%phi(index) = cart2pol(v(:,1),v(:,2),v(:,3));

	%pause(0.001)
	%clf


		
end


%figure
%subplot 211
%histogram(Theta, 20);title("Angle between vector and XoY")
%subplot 212
%histogram(pos); title('Distance between "real point" and observed');

media = sum(pos)/length(pos);
maxx = max(pos);
fprintf('Media: %f\n Biggest Distance: %f\n',media,maxx);

%figure
%sphplot(phi,theta+90)

toc