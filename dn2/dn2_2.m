T1 = [1;5];
T2 = [6;2];

% 1. naloga
g = 9.81;
T2_nov = T2-T1;
[theta,k] = poisciOpt_theta_k(T2_nov(1),T2_nov(2));
cas = k/sqrt(2*g) * theta;

% 2. naloga
T3 = [3;2];
koef = (T3(2) - T1(2)) / (T3(1) - T1(1));
y = @(x) koef * x;
dy = @(x) koef;
f = @(x) sqrt((1 + dy(x).^2)./(2*g.*(-y(x))));
T3_nov = T3-T1;
cas_po_premici = integral(f,0,T3_nov(1));

% v = sqrt(2gh) -> h = 3, s = 3
cas_po_konstanti = 3 / sqrt(2*g*3);

%y3 = @(x) -3;
%cas_po_konstanti = integral(@(x) sqrt(1./(2*g.*(v-y3(x)))),2,5, 'ArrayValued', true);
skupen_cas = cas_po_premici + cas_po_konstanti;

% 3. naloga
y2 = @(th) -1/2 * k^2 * (1 - cos(th));
odg3 = sqrt(2 * g * (-y2(theta)));

% 4. naloga
theta4 = linspace(0, theta, 1000);
odg4 = max(sqrt(2 * g * (-y2(theta4))));

% 5. naloga
cas5 = 1.5;
funkcija_casa = @(d) k/sqrt(2*g) * (theta+d) - cas5;
koliko_d = fzero(funkcija_casa,0.6);
x = @(th) 1/2 * k^2 * (th - sin(th)) + T1(1);
y = @(th) -1/2 * k^2 * (1 - cos(th)) + T1(2);
x_dtheta = x(theta+koliko_d);
y_dtheta = y(theta+koliko_d);
odg5 = norm([x_dtheta(end);y_dtheta(end)]);

brahistohrona(T1,[x_dtheta(end);y_dtheta(end)])
hold on
brahistohrona(T1,T2)

