T1 = [0;5.7];
T2 = [8.2;2];
g = 9.81;

% 1. naloga
T2_nov = T2-T1;
[theta,k] = poisciOpt_theta_k(T2_nov(1),T2_nov(2));
odg1 = k/sqrt(2*g) * theta;

% 2. naloga
brahistohrona(T1,T2);
x = @(th) 1/2 *k^2*(th-sin(th)) + T1(1);
y = @(th) -1/2 * k^2 * (1 - cos(th)) + T1(2) - 3;
theta1 = fzero(y,theta);
y1 = @(th) -1/2 * k^2 * (1 - cos(th));
odg2 = sqrt(2 * g * (-y1(theta1)));

% 3. naloga
y3 = @(x) brahistohrona_tri(T1,T2,x)-2;
odg3 = fzero(y3,15);

% 4. naloga
dy = @(th) -1/2 * k^2 * sin(th);
theta_pol = fzero(dy, 2);
kje = x(theta_pol);
odg4 = k/sqrt(2*g) * theta_pol;

% 5. naloga
enacba = @(a) [a(1) * sin(T1(1)/4) + a(2) - T1(2), a(1) * sin(T2(1)/4) + a(2) - T2(2)];
% rez(2) = 0, vendar ne pride iz enacbe
rez = fsolve(enacba, [1,10]);
s = @(x) rez(1) .* sin(x/4);
ds = @(x) rez(1) * 1/4 .* cos(x/4);
f = @(x) sqrt((1 + ds(x).^2)./(2*g.*(-s(x))));
odg5 = integral(f,0,8.2);

