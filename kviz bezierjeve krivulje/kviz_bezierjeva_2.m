bx = [0 1 3 4];
by = [1 2 2 -1];
x2 = 2 + rand(1);
cx = [0 1 x2 4];
cy = [0 -1 -1 2];
c = [cx; cy];
b = [bx; by];

plotBezier(c)
hold on
plotBezier(b)
%t = linspace(0,1);
%y = @(t) t - 1;
%plot(t,y(t))
hold on

% 1 . vprasanje
T1 = deCasteljau(c,0.5);
odg1 = T1(1);

% 2. vprasanje
dc = bezier_der(c,0.5,1);
odg2 = norm(dc);

% 3. vprasanje
y = T1(2);
odg3 = sqrt(y^2 + odg1^2);

% 4. vprasanje
dc2 = bezier_der(c,0.5,2);
dcx2 = dc2(1);
dcy2 = dc2(2);
dcx = dc(1);
dcy = dc(2);
odg4 = (dcx.*dcy2 - dcy.*dcx2)/(dcx.^2 + dcy.^2).^(3/2);

% 5. vprasanje
% [0 -1] je tocka na premici y = x - 1, [1 1] je smerni vektor premice
odg5 = presek_s_premico(c,[0 -1;1 1],1e-15);

% 6. vprasanje
enacba = @(t) [deCasteljau(c,t(1)) - deCasteljau(b,t(2));];
kateri_t = fsolve(enacba,[0.5;0.5]);
deCasteljau(c,kateri_t(1));
tocka = deCasteljau(c,kateri_t(1));
odg6 = tocka(2);
plot(tocka(1),tocka(2),'o')







