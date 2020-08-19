function f = sphplot(elevation,azimuth)

[x,y,z] = sphere; 
x = x(11:end,:);
y = y(11:end,:); 
z = z(11:end,:);
r = 1; 
surf(r.*x,r.*y,r.*z,'FaceColor','yellow','FaceAlpha',0.1); 
axis equal;xlabel("X");ylabel("Y");zlabel("Z");
hold on


for i = 1:length(elevation)
    xcart = 0;ycart=0;zcart=0;
    [xcart,ycart,zcart] = sph2cart(azimuth(i),elevation(i),1);
    scatter3(xcart,ycart,abs(zcart),5,"r")
     
end
end

