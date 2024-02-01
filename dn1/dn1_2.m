
M = [1,2,1,2,1,2,1,2];
L = [1,1.5,1,1.5,1,1.5,1,1.5];
obesisceL = [1;5];
obesisceD = [6;2];
w0 = [-1;-1];
g = 9.81;
    
%odgovor na 1. vprasanje
x1 = diskrVeriznica(w0,obesisceL,obesisceD,L,M);
odg1 = mean(x1(1,:));   
    
%odgovor na 2. vprasanje
%Wp je enacba (3.5) in rabim konstruirati vektor visin in na koncu pomnoziti z g 
y = x1(2,:);
h = zeros(1,size(M,2));
for i=1:size(M,2)
    h(i) = (y(i) + y(i+1))/2;
end
odg2 = M * h'* g;
    
%odgovor na 3. vprasanje
L2 = [0.5,0.5,0.75,0.75,0.5,0.5,0.75,0.75,0.5,0.5,0.75,0.75,0.5,0.5,0.75,0.75];
M2 = [0.5,0.5,1,1,0.5,0.5,1,1,0.5,0.5,1,1,0.5,0.5,1,1];
%resitev je y-koordinata najnizje tocke
odg3 = diskrVeriznica(w0,obesisceL,obesisceD,L2,M2);
  
%odgovor za 4. vprašanje 
odg4 = fzero(@(h)potencialna(h)-180,180);

%odgovor na 5. vprasanje
x2 = diskrVeriznica(w0,obesisceL,[8.5;0],L,M);
hold on
%ko jo zravnamo se x koordinata prestavi v levo za dolzino 1.5+1, y
%koordinata pa je 0
x3 = diskrVeriznica(w0,obesisceL,[6;0],[1,1.5,1,1.5,1,1.5],[1,2,1,2,1,2]);
y3 = x3(2,:);
odg5 = mean([y3 0 0]);





