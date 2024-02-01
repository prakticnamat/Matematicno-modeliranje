t = linspace(0,1);
x = deCast([0 2 3 4 3],t);
y = deCast([0 1 -2 1 1],t);
plot(x,y)

% odvod_x = deCast(stopnja_n*diff([0 2 3 4 3]),1/3), stopnja_n je za ena
% manj od velikosti vektorja [0 2 3 4 3]
odvod_x = deCast(4*diff([0 2 3 4 3]),1/3);
odvod_y = deCast(4*diff([0 1 -2 1 1]),1/3);

%ce zelimo prestavit celotno krivuljo za 2 gor, bi samo za 2 povecali vsako
%kontrolno tocko, enako bi bilo za rotacijo->spremenimo kontrolne tocke