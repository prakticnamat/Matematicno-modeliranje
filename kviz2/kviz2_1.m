obesisceL = [0.8;20.1];
obesisceD = [10.3;15.2];
L = 15.5;

% 1. naloga
Tmin = zvVeriznica(obesisceL,obesisceD,L,10e-15);
odg1 = Tmin(2);

% 2. naloga
a=obesisceL(1);
A=obesisceL(2);
b=obesisceD(1);
B=obesisceD(2);
z0=1;
z = zvVeriznica_iteracijskaFun(a,A,b,B,L,z0,10e-15);
v= atanh((B-A)/L) + z;
u= atanh((B-A)/L) - z;
C=(b-a)/(v-u);
D=(a*v-b*u)/(v-u);
lambda=A-C*cosh((a-D)/C);
w = @(x)lambda + C*cosh((x-D)/C) ;
dw = @(x) sinh((x-D)/C);

odg2= dw(obesisceD(1));

% 3. naloga
C = @(x) zvVeriznica_nova([obesisceL(1)+x;obesisceL(2)],obesisceD,L,10e-15)-12;
odg3 = fzero(C, 0.5);

% 4. naloga
[l1,d1] = zvVeriznica_dolzina(obesisceL,obesisceD,Tmin,L,10e-15);
odg4 = min(obesisceL(2)-l1,obesisceD(2)-d1);

% 5. naloga
funkcija = @(x) zvVeriznica_min(obesisceL,obesisceD,L,10e-15,x) - obesisceD(1);
odg5 = fzero(funkcija, 7);

