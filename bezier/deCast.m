function tocke = deCast(b,t)
% Izracuna tocke na Bezierjevi krivulji (st. n) s kontrolnimi tockami b s pomocjo de
% Casteljaujevega algoritma.
% b je vektor velikosti (n+1),
% metoda vrne tocke, enake velikosti kot je t.

[~,n] = size(t);
[~,m] = size(b);
tocke = zeros(1,n);
b_nov = b;
for i=1:n
    b_nov = b;
    for j=1:m-1
        [~,l] = size(b_nov);
        b_nov = b_nov(1:l-1).*(1-t(i)) + b_nov(2:l).*t(i);
    end
    tocke(i) = b_nov;
end



