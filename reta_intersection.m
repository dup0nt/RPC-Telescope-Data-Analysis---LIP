function point = reta_intersection(XYZ1,XYZ2,imgzposition_2)

%Input of XYZ1 MUST a 3D VECTOR/POINT  e.g. XYZ1 = [1 2 3]
%plain MUST be the intersecting plain, in this case the corepix num2
syms t x y z

P = [x,y,z];

planefunction = conj(z) - imgzposition_2;

line = XYZ1 + t*(XYZ2-XYZ1);
newfunction = subs(planefunction, P, line);

%Solving the line equation so we can find the exact intersection point

t0 = solve(newfunction);
point = subs(line, t, t0);

end






