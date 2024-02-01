h0 = 40000; %metri
g0 = 9.81;
r = 6371; %kilometri
g = @(h) g0 * (r/(r+h))^2;
m = 90; %kilogrami
c = 1; %koeficient zracnega upora
S = 0.9; %m**2
ro = @(y)  5.038514626813336e-03 + 6.488352761211669e-02*((y-40000)/40000).^(2) + 1.158827281393931e+00*((y-40000)/40000).^(4); 

%odgvor na 1. vprašanje
[y,v,t] = padalec([m,c,S],[h0;0],25,10000);
odg1 = y(1,1) - y(end,1);

%odgovor na 2. vprašanje
[y1,v1,t1] = padalec([m+100,c+0.1,S+0.1],[h0;0],60,10000);
[y2,v2,t2] = padalec([m,c,S],[h0;0],60,10000);
odg2 = abs(v1(end,1)-v2(end,1));

%odgovor na 3. vprašanje
[y3,v3,t3] = padalec([m,c,S],[h0;0],10000,10000);
odg3 = min(v3);

%odgovor na 4. vprašanje
odg4 = fzero(@(t_opt) nova(t_opt),300);





