function [pos] = dist_pos(path, file)




load(path + file);


I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1;EventM1 = sum(M1.');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1;EventM2 = sum(M2.');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1;EventM3 = sum(M3.');


found= find(EventM1 == 1 & EventM3 == 1 & EventM2==1);

imgzposition_3 = 145*2/43;
imgzposition_2 = imgzposition_3/2;

x = 0:7;
y = x; 


 
figure;
colormap summer
index = 0;
pos = [];



%largura = 43;		%mm
%espacamento = 7;	%mm

for i = found			%9652
	
	new_1 = M1(i, :);
	new_1 = reshape(new_1,7,7)';
	
	new_3 = M3(i, :);
	new_3 = reshape(new_3,7,7)';
	
	new_2 = M2(i, :);
	new_2 = reshape(new_2,7,7)';

	
		
	index = index + 1;


	[x1,y1] = find(new_1==1);
	[x2,y2] = find(new_2==1);
	[x3,y3] = find(new_3==1);


	a = [x1-0.5,y1-0.5,0];
	b = [x3-0.5,y3-0.5,imgzposition_3];


	ponto_intersec = reta_intersection(a,b,imgzposition_2);
	ponto_intersec = double(ponto_intersec);
	
	
	v = b-a;

	

	
	%Vetor para distancia
	X1 = x2-0.5-ponto_intersec(1);
	Y1 = y2-0.5-ponto_intersec(2);

	pos = [pos sqrt((X1).^2+(Y1).^2)];


		
end


end

