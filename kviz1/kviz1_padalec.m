format long

m = 126;
c = 1.4;
s = 1.2;
zac = [40000; 0];
n = 10000;

% 1.vprasanje
tk = 100;

[y,~,~] = padalec([m, c, s],zac,tk,n);
odg1 = y(end);


% 2.vprasanje
tk = 200;

[~,v,~] = padalec([m, c, s],zac,tk,n);
rez1 = v(end);

zac = [40000; -10];

[~,v,~] = padalec([m, c, s],zac,tk,n);
rez2 = v(end);

odg2 = abs(rez2-rez1);


% 3.vprasanje
zac = [40000; 0];

[y,v,~] = padalec([m, c, s],zac,tk,n);
rez1 = v(end);

zac = [y(end); v(end)];
c = c*4;
s = s*4;
tk = 10;

[~,v,~] = padalec([m, c, s],zac,tk,n);
rez2 = v(end);

odg3 = abs(rez1-rez2);


% 4.vprasanje
fun = @(m) kviz1_padalec_4(m);
odg4 = fzero(fun,100);


% 5.vprasanje
fun = @(t) kviz1_padalec_5(t) - 1000;
odg5 = fzero(fun, 20)



