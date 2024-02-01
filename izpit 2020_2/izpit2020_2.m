L = 12;
obesisceL = [0.7;7];
obesisceD = [4;6];

% 1.1
m1 = zvVeriznica(obesisceL,obesisceD,L,10e-15);
m2 = zvVeriznica(obesisceL - [0;1],obesisceD + [0;2],L,10e-15);
odg11 = sqrt((m1(1)-m2(1))^2 + (m1(2)-m2(2))^2);


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
w1 = @(x) lambda + C * cosh((x-D)/C);

%1.3
ploscina = integral(w1,0.7,4);

obesisceL2 = obesisceL - [0;1];
obesisceD2 = obesisceD + [0;2];
a2 = obesisceL2(1);
b2 = obesisceD2(1);
A2 = obesisceL2(2);
B2 = obesisceD2(2);
z0 = 1;
z2 = zvVeriznica_iteracijskaFun(a2,A2,b2,B2,L,z0,10e-15);
v2 = atanh((B2-A2)/L) + z2;
u2 = atanh((B2-A2)/L) - z2;
C2 = (b2-a2)/(v2-u2);
D2 = (a2*v2-b2*u2)/(v2-u2);
lambda = A2 - C2 * cosh((a2-D2)/C2);
w2 = @(x) lambda + C2 * cosh((x-D2)/C2);

% 1.2
nova = @(x) w1(x) - w2(x);
ordinata = w1(fzero(nova,3));

% 1.4

w3 = diskrVeriznica([-1;-1],obesisceL,obesisceD,[12/5,12/5,12/5,12/5,12/5],[1,1,1,1,1]);
odg14 = abs(m1(2) - min(w3(2,:)));


b = [0 1.8 2 1 2 3.1; 0 0 3.1 0 -1 0];
bx = [0 1.8 2 1 2 3.1];
by = [0 0 3.1 0 -1 0];

% 2.1
plotBezier(b);
t = linspace(0,1,100);
odg21 = mean(deCast(bx,t));

% 2.2
%presek = presek_s_premico(b,[2 0;1 0],10e-15);
de = @(x) deCast_za_presek(bx,x) - 2;
kasen_t = fzero(de,1/3);
odg22 = deCast(by,kasen_t);

% 2.3
r_b = rotiraj_bezier(b,pi/6);
k = (r_b(2,6)-r_b(2,5))/(r_b(1,6)-r_b(1,5));
n = r_b(2,6) - k * r_b(1,6);
premica = @(x) k * x + n;
odg23 = fzero(premica,1.7);

% 3.1
c = 2.00;
f = @(r) c - r;
R = 2;
[r2,u2] = upogib_opne(f,R,20);
odg31 = u2(11);

% 3.2
[rf,uf] = upogib_opne(f,R,40);
odg32 = uf(1) - u2(1);

% 3.3
koliko_c = @(c) upogib_opne_koliko_c(@(r) c - r,R,20) + 1;
odg33 = fzero(koliko_c,3);

