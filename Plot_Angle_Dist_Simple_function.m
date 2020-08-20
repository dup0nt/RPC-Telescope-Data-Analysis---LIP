function [theta,phi,pos] = Plot_Angle_Dist_Simple_function(pathe,file)


load(pathe + file)

I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1; EventM1 = sum(M1.');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1; EventM2 = sum(M2.');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1; EventM3 = sum(M3.');

found = find(EventM1 == 1 & EventM3 == 1 & EventM2 == 1);

imgzposition_1 = 0;
imgzposition_3 = 145*2/43;
imgzposition_2 = imgzposition_3/2;

theta = zeros(1,length(found));
pos = zeros(1,length(found));
phi = zeros(1,length(found));
index = 0;


for i = found
	index = index + 1;	

	new_1 = M1(i, :);
	new_1 = reshape(new_1,7,7)';
	[x1,y1] = find(new_1==1);
	a = [x1-rand(),y1-rand(),0];

	new_3 = M3(i, :);
	new_3 = reshape(new_3,7,7)';
	[x3,y3] = find(new_3==1);
	b = [x3-rand(),y3-rand(),imgzposition_3];

	v = b-a;

	new_2 = M2(i, :);
	new_2 = reshape(new_2,7,7)';
	[x2,y2] = find(new_2==1);

	theta(index) = atan2(sqrt(v(1)^2+v(2)^2),v(3));
	normal = [0,0,1];
	
	ponto_intersec = double(plane_line_intersect(normal,[0,0,imgzposition_2],a,b));
	dist = [x2-0.5-ponto_intersec(1),y2-0.5-ponto_intersec(2)];
	pos(index) = sqrt((dist(1))^2+(dist(2))^2);
	phi(index) = cart2pol(v(:,1),v(:,2),v(:,3));

end

end