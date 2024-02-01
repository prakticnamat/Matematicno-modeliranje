function tocka = deCasteljau(b,t)
% DE_CASTELJAU izracuna tocko na Bezierovi krivulji pri parametru t
% s pomocjo de Casteljauovega algoritma.
% Stolpci matrike b = [xs; ys] so kontrolne tocke Bezierove krivulje.
% povzeto od https://github.com/nikerzetic/matematicno-modeliranje/tree/master


n = size(b,2);

for i = 2:n
    b = (1-t).*b(:,1:end-1) + t.*b(:,2:end);   
end

tocka = b(:,end);

end