obesisceL = [0;20];
obesisceD = [10;15];
L = 15;

% 1. naloga
Tmin = zvVeriznica(obesisceL,obesisceD,L,10e-15);
odg1 = Tmin(1);

% 2. naloga
ravna = sqrt((obesisceL(1)-obesisceD(1))^2+(obesisceL(2)-obesisceD(2))^2);
odg2 = L - ravna;

% 3. naloga
C = @(x) zvVeriznica_nova(obesisceL,obesisceD,x,10e-15)-14;
odg3 = fzero(C, 15);

% 4. naloga
% l1 je dolzina od A do Tmin, ki se ohrani
[l1, d1] = zvVeriznica_dolzina(obesisceL,obesisceD,Tmin,L,10e-15);
% minimum veriznice dolzine 14
veriznica = zvVeriznica(obesisceL,obesisceD,14,10e-15);
% l2 je dolzina od A do veriznice
[l2, d2] = zvVeriznica_dolzina(obesisceL,obesisceD,veriznica,14,10e-15);
% razlika za koliko se premakne klin v desno je potem l1-l2, ker nas
% sprasuje za razliko v x-smeri moram dobiti še katera točka je to, zato
% verižnici prištejem to razliko
premik_v_desno = veriznica(1) + (l1-l2);
odg4 = premik_v_desno - Tmin(1);


