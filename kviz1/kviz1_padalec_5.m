function r = kviz1_padalec_5(tk)
    
    m = 126;
    c = 1.4;
    s = 1.2;
    zac = [40000; 0];
    n = 10000;

    [y,~,~] = padalec([m, c, s],zac,tk,n);
    y1 = y(end);
    
    tk = tk-10;
    [y,~,~] = padalec([m, c, s],zac,tk,n);
    y2 = y(end);

    r = y2 - y1;

end