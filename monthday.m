
function [year,month,day] = monthday(file)
year = [];
month = [];
day = [];


data = char(file);

year  = data(1:4); 
month = data(5:6);
day   = data(7:8); 

end









