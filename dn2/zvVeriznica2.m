function oddaljenost = zvVeriznica2(obesisceL,obesisceD,L,tol,x)
% function T_min = zvVeriznica(obesisceL,obesisceD,L,tol)
% Funkcija zvVeriznica narise zvezno veriznico in poisce njeno najnizjo tocko.
%
% Po knjigi Matematicno modeliranje (E. Zakrajsek).
%
% Vhod
% obesisceL, obesisceD: levo in desno obesisce veriznice, obesisceL=[a;A], obesisceD=[b;B]
% L:                    dolzina
% tol:                  toleranca pri iteraciji
%
% Izhod
% T_min:                najnizja tocka veriznice
%

a = obesisceL(1);
b = obesisceD(1);
A = obesisceL(2);
B = obesisceD(2);
z0 = 1;
% Jacobijeva iteracija za enacbo (15)
z = zvVeriznica_iteracijskaFun(a,A,b,B,L,z0,tol);

% parametri v,u,C,D na koncu strani 4
v = atanh((B-A)/L) + z;
u = atanh((B-A)/L) - z;
C = (b-a)/(v-u);
%D =2.5;
D = (a*v-b*u)/(v-u);
% lambda, iz enacbe (5) ali (6)

lambda = A - C * cosh((a-D)/C);

% funkcija w, enacba (4)
w = @(x) lambda + C * cosh((x-D)/C);

oddaljenost = sqrt(x^2+w(x)^2);

