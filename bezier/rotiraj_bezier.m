function b = rotiraj_bezier(b,phi)
% ROTIRAJ_BEZIER rotira Bezierovo krivuljo, podano s kontrolnimi
% tockami b, za kot phi okrog prve kontrolne tocke. Izrise tudi
% zacetno in rotirano krivuljo ter oba kontrolna poligona.
% povzeto od https://github.com/nikerzetic/matematicno-modeliranje/tree/master


plotBezier(b);
R = [cos(phi) -sin(phi); sin(phi) cos(phi)];

for i = 2:size(b,2)
    b(:,i) = R*(b(:,i) - b(:,1)) + b(:,1); 
end

plotBezier(b);

b
end