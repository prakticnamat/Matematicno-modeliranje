T1 = @(x) [x;5.1];
T2 = [5.1;0.1];
t = 1.35;
g = 9.81;


% 1.1
f = @(x) brahistohrona([x;5.1],T2) - t;
odg1 = fsolve(f,2);
premik = T2 - [odg1;5.1];

% 1.2
T3x = 3/4 * odg1 + 1/4 * 5.1;
[xx,yy] = brahistohrona2([odg1;5.1],T2);
fun = @(j) xx(j) - T3x;
th = fzero(fun,0.3);
odg2 = yy(th);

% 1.3
koef = (T2(2) - 5.1) / (T2(1) - odg1);
y = @(x) koef * x;
dy = @(x) koef;
f = @(x) sqrt((1 + dy(x).^2)./(2*g.*(-y(x))));
odg3 = integral(f,0,premik(1));


% 2.1
L = 12.4;
obesisceL = [0.8;7];
obesisceD = [4;6.1];
T33 = [0.8;6];
T4 = [4;8.1];
m1 = zvVeriznica(obesisceL,obesisceD,L,10e-15);
m2 = zvVeriznica(T33,T4,L,10e-15);
odg21 = sqrt((m1(1)-m2(1))^2 + (m1(2)-m2(2))^2);

% 2.2
a = obesisceL(1);
b = obesisceD(1);
A = obesisceL(2);
B = obesisceD(2);
z0 = 1;
z = zvVeriznica_iteracijskaFun(a,A,b,B,L,z0,10e-15);
v = atanh((B-A)/L) + z;
u = atanh((B-A)/L) - z;
C = (b-a)/(v-u);
D = (a*v-b*u)/(v-u);
lambda = A - C * cosh((a-D)/C);
w = @(x) lambda + C * cosh((x-D)/C);

premica = @(x) 2*x;
abcisa = fzero(@(x) w(x) - premica(x), 1);
odg22 = w(abcisa);

% 2.3
[l1, d1] = zvVeriznica_dolzina(obesisceL,obesisceD,m1,L,10e-15);

% 2.4 


% 3.1
l = 12;
T1 = [0;6];
T2 = [4 + 61/100;3];
Tmin = zvVeriznica(T1,T2,l,10e-16);
odg31 = sqrt(Tmin(1)^2 + Tmin(2)^2);

% 3.2
s = sqrt((T1(1)-T2(1))^2 + (T1(2)-T2(2))^2);
odg32 = s/3;

% 3.3
[l2,d2] = zvVeriznica_dolzina(T1,T2,Tmin,l,10e-15);
odg33 = l2/3;

% 3.4
oddaljenost = @(x) zvVeriznica2(T1,T2,l,10e-15,x);
odg4 = fminbnd(oddaljenost,0,3)

