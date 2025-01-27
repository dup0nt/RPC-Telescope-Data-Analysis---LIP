tic

clear all
data = string(importdata('.\Scans_Cloud\helper.txt'));
theta1=[]; phi1 = [];

% clear all, close all
% data = importdata('.\HV_Scan\helper.txt');
% theta1=[]; phi1 = []


for j = 1:1
	
	load('.\Scans_Cloud\' + data(j))


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
		
		ponto_intersec = double(reta_intersection(a,b,imgzposition_2));
		dist = [x2-0.5-ponto_intersec(1),y2-0.5-ponto_intersec(2)];
		pos(index) = sqrt((dist(1))^2+(dist(2))^2);
		phi(index) = cart2pol(v(:,1),v(:,2),v(:,3));
		
	end

	%theta = rad2deg(theta);

	% media = sum(pos)/length(pos);
	% maxx = max(pos);
	% fprintf('Media: %f \nBiggest Distance: %f\n',media,maxx);

	theta1 = [theta1 theta];
	phi1 = [phi1 phi];

end

%figure

%sphplot(theta1+pi/2,phi1)
hold off
%length(data)


toc
(