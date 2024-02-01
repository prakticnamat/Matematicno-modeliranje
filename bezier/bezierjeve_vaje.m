b1C = [0.0000 199.8000 382.5000 382.5000 382.5000 199.8000 0.0000 ; 
    117.0000 117.0000 268.2000 454.5000 640.8000 792.0000 792.0000 ];
b1Cx = [0.0000 199.8000 382.5000 382.5000 382.5000 199.8000 0.0000];
b1Cy = [117.0000 117.0000 268.2000 454.5000 640.8000 792.0000 792.0000];

% 1. vprasanje
n = size(b1Cx,2)-1;
x = n * diff(b1Cx);
y = n * diff(b1Cy);
dolzina = integral(@(t) sqrt(deCast(x,t).^2 + deCast(y,t).^2),0,1);
lok = pi*(792-117)/2;
odg1 = abs(dolzina-lok);

% 2. vprasanje
b2Cx = 4/3 .* b1Cx;
% (b2x,b2y) = 4/3 * (b1x,b1y) + (n1,n2) -> (0,792) = 4/3 * (0,792) +
% (n1,n2) -> n1 = 0, n2 = 792-4/3 * 792
b2Cy = 4/3 .* b1Cy + (792-4/3 * 792);
odg2 = min(b2Cy);

% 3. vprasanje
t = linspace(0,1,100);
plot(deCast(b1Cx,t), deCast(b1Cy,t));

plot(deCast(b2Cx,t), deCast(b2Cy,t));


%plotBezier(b1C)
kot_zrcaljenja = atan2(-30, b2Cx(6)); % Kot med končno točko in x-osjo
b2Cx_zrcaljeno = b2Cx * cos(kot_zrcaljenja) - (-b2Cy) * sin(kot_zrcaljenja);
b2Cy_zrcaljeno = b2Cx * sin(kot_zrcaljenja) + (-b2Cy) * cos(kot_zrcaljenja);
%plot(deCast(b2Cx_zrcaljeno,t), deCast(b2Cy_zrcaljeno,t))
odg3 = mean(b2Cx_zrcaljeno);








