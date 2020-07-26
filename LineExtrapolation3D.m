function [X0,Y0] = LineExtrapolation3D(XYZ1,XYZ2,Z0)

%Z0 is the hight of the telescope plane.

%[X1_1 X2_1;X1_2 X2_2;X1_3 X2_3] Same for X,Y, Z
%[1 2; 3 4;5 6]'
% 1     3     5
% 2     4     6
plot3([XYZ1(:,1)'; XYZ2(:,1)'],[XYZ1(:,2)'; XYZ2(:,2)'],[XYZ1(:,3)'; XYZ2(:,3)'],'.-r');

%This is the vector along the line
save tmpp
U = [XYZ2 - XYZ1];

Y0 = (U(:,2).*Z0 + U(:,3).*XYZ1(:,2) - U(:,2).*XYZ1(:,3))./U(:,3);
X0 = (U(:,1).*Y0 + U(:,2).*XYZ1(:,1) - U(:,1).*XYZ1(:,2))./U(:,2);

end
