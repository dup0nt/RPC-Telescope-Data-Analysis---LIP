function I = plane_line_intersect(n,V0,P0,P1)

I=[0 0 0];
u = P1-P0;
w = P0 - V0;
D = dot(n,u);
N = -dot(n,w);

sI = N / D;
I = P0+ sI.*u;

end














