function k = poisciOpt_k(b,B)
% function [theta,k] = poisciOpt_theta_k(b,B)
%
% Funkcija poisce netrivialen theta za brahistohrono, tako da g(theta)=0.
% Poleg thete vrne tudi konstanto k.
%

% definiramo funkcijo g (konec strani 2)

% resimo nelin. enacbo (s funkcijo fzero) --> theta, k
g = @(th) 1 - cos(th) + (B/b) * (th - sin(th));
theta = fzero(@(th) g(th),pi);
k = sqrt(2*b/(theta - sin(theta)));


end