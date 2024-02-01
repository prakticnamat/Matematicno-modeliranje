function visina = nova(t_opt)
    h0 = 40000; %metri
    m = 90; %kilogrami
    c = 1; %koeficient zracnega upora
    S = 0.9; %m**2
    [y4,v4,~] = padalec([m,c,S],[h0;0],t_opt,10000);
    [y5,~,~] = padalec([m,c*5,S+10],[y4(end,1);v4(end,1)],400-t_opt,10000);
    visina =  y5(end,1);
end
