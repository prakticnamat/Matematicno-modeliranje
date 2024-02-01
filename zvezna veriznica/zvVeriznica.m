function T_min = zvVeriznica(obesisceL,obesisceD,L,tol)
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

dw = @(x) sinh((x-D)/C);
%odgovori za kviz
%y = @(x) w(x) - x;
%odgovor3 = fzero(y,1); %v okolici tocek 1 se bosta grafa sekala, vidim iz slike

%poiscem x-vrednost presecisca funkcije w in y=4
%y2 = @(x) w(x)-4;
%presecisce = fzero(y2,0.5);
% poracunam locni dolzini -> integral meje so pa b = obesisceL(1) in a = presecisce,
% drugic pa b = obesisceL(1) in a = presecisce; a,b meje integrala
%l1 = integral(@(x)(sqrt(1+(dw(x)).^2)),a,presecisce);
%l2 = integral(@(x)(sqrt(1+(dw(x)).^2)),presecisce,b);

%odgovor na zadnje vprasanje, to pomeni, to pomeni da mora v enacbi (4) se
%vedno veljati pogoj cosh(0) = 1, ampak sedaj ze vemo, da je to pri x=2.5,
%od koder sledi, da je potem D = 2.5, ker drugace ni izpolnjen pogoj
%cosh(0) = 1. Vrednost b ostane ista, spremeni se samo B, zato moramo cisto 
%na zacetku nastaviti vrednost D =2.5, ker nadaljne enacbe vsebujejo tudi D.
%BB = lambda + C * cosh((b-D)/C);

% graf veriznice
x = linspace(a,b,100);
plot(x,w(x),'b','LineWidth',0.5)
hold on
plot([a,b],[A,B],'ko','MarkerSize',5,'MarkerFaceColor','r');



% najnizja tocka, iz (4), ko je cosh(0) = 1
T_min = [D; lambda + C];



plot(T_min(1),T_min(2),'ko','MarkerSize',5,'MarkerFaceColor','g');
grid on;
hold off