T1 = [1; 5];
T2 = [7; 3];
g = 9.81;
T2_nov = T2-T1;
[theta,k] = poisciOpt_theta_k(T2_nov(1),T2_nov(2));
%cas potovanja kroglice
cas = k/sqrt(2*g) * theta;

%cas potovanja po premici cez T1 in T2
koef = (T2(2) - T1(2)) / (T2(1) - T1(1));
y = @(x) koef * x;
dy = @(x) koef;
f = @(x) sqrt((1 + dy(x).^2)./(2*g.*(-y(x))));
cas_po_premici = integral(f,0,T2_nov(1));

%cas potovanja po paraboli s temenom v T2
y1 = @(x) () * (x - T2(1)).^2 + T2(1);
