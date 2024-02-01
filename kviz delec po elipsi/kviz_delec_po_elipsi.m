seme=48;rand('seed',seme);
a=6+rand(1);
x = @(t) a.*cos(t);
y = @(t) (a+1).*sin(t);

T = linspace(0,2*pi);
plot(x(T),y(T))
hold on
axis equal;

% 1.
odg1 = sqrt(x(sqrt(2))^2 + y(sqrt(2))^2);

% 2.
tocka = [12;5];
f = @(t) sqrt((x(t)-12)^2 + (y(t)-5)^2);
odg2 = fminsearch(f,1);

% 3.
odg3 = f(odg2);

% 4.
px = @(t) t;
py = @(t) exp(t);
plot(px(linspace(0,3)),py(linspace(0,3)),'--')
f2 = @(t) [x(t(1)) - px(t(1));y(t(2))-py(t(2))];
odg4 = fsolve(f2,[3;6])

