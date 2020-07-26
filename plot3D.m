clear all, close all

load('.\HV_Scan\20200406105251_5980V.mat')

I = find(Q1 > 0); M1 = Q1*0; M1(I) = 1; EventM1 = sum(M1');
I = find(Q2 > 0); M2 = Q2*0; M2(I) = 1; EventM2 = sum(M2');
I = find(Q3 > 0); M3 = Q3*0; M3(I) = 1; EventM3 = sum(M3');
I = find(Q4 > 0); M4 = Q4*0; M4(I) = 1; EventM4 = sum(M4');

imgzposition_1 = 0;
imgzposition_3 = 500;

x = 1:49;
y = 1:9652;
 

min_x = min(min(x));
min_y = min(min(y));
max_x = max(max(x));
max_y = max(max(y));
 
figure; hold on;
colormap summer
% ===================== Para Core Pix 1 ===================================

surf([min_x max_x],[min_y max_y],repmat(imgzposition_1, [2 2]),...
    M1,'facecolor','texture')
 
 
% desired z position of the image plane.
imgzposition = -10;
 
% plot the image plane using surf.
surf([min_x max_x],[min_y max_y],repmat(imgzposition_3, [2 2]),...
    M3,'facecolor','texture')
 
 
% set the view angle.
view(45,30);
 
% labels
 
xlabel('x');
ylabel('y');
zlabel('z');
