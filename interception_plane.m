function point = interception_plane(v1,v2,imgzposition_2)


    %imgzposition_2 é a altura do plano normal
    %v1 e v2 são os valores dos pontos nos planos a cima e abaixo
    P1 = [0,0,imgzposition_2];
    P2 = [1,1,imgzposition_2];
    P3 = [2,3,imgzposition_2];
    normal = cross(P1-P2, P1-P3)
    syms x y z
    P = [x,y,z];
    planefunction = dot(P-P1,normal);
    syms t
    line = v1 + t*(v2-v1);
    
    newfunction = subs(planefunction, P, line);t0 = solve(newfunction);
    point = subs(line, t, t0)
    subs(planefunction, P, point);
end

