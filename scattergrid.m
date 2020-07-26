
function f = scattergrid(value1,value2)

for i = linspace(0.5,6.5,7) 

x_map= linspace(0.5,6.5,7);
y_map= i*ones(1,length(x_map));

z_map500 = value2*ones(1,length(x_map));
z_map000 = value1*zeros(1,length(x_map));


scatter3(x_map,y_map,z_map000,'filled',"b")
scatter3(x_map,y_map,z_map500,'filled',"b")
end

end