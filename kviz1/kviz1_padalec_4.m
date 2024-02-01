function y1 = kviz1_padalec_4(m)
    
    c = 1.4;
    s = 1.2;
    zac = [40000; 0];
    n = 10000;
    tk = 400;
    [y,~,~] = padalec([m, c, s],zac,tk,n);
    y1 = y(end);

end