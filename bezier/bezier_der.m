function v = bezier_der(b,t,r)
% Funkcija bezier_der s pomo;jo de Casteljaujevaga algoritma izracuna r-ti
% odvod Bezierjeve krivulje b.
% povzeto od https://github.com/nikerzetic/matematicno-modeliranje/tree/master


for i = 1:r
    b = (length(b)-1) * diff(b,1,2);
end
v = deCasteljau(b,t);
