format long

T0 = [2.3;3.0];
T1 = [6.0;1.0];
M = [1.0,2.0,5.0,1.4,1.0,2.0];
L = [1.0,1.5,1.0,1.5,1.0,1.0];
g = 9.81;


% 1.vprasanje
X = diskrVeriznica([-1;-1], T0, T1, L, M);

h = X(2,2:end)/2 + X(2,1:end-1)/2;

odg1 = M * h' * g;


% 2.vprasanje
max_razlika = 0;
[~,n] = size(X);
for i=2:n
    razlika = abs(X(2,i-1) - X(2,i));
    if razlika > max_razlika
        max_razlika = razlika;
    end
end

odg2 = max_razlika;


% 3.vprasanje
M = [1,1,1,1,1,1];
L = [2,2,2,2,2,2];
X = diskrVeriznica([-1;-1], T0, T1, L, M);

odg3 = min(min(X));


% 4.vprasanje
M = [1.0,2.0,5.0,1.4,1.0,2.0];
L = [1.0,1.5,1.0,1.5,1.0,1.0];

X = diskrVeriznica([-1;-1], T0, T1, L, M);

T0a = X(:,2);

M = [2.0,5.0,1.4,1.0,2.0];
L = [1.5,1.0,1.5,1.0,1.0];

X = [T0 diskrVeriznica([1;1], T0a, T1, L, M)];

M = [1.0,2.0,5.0,1.4,1.0,2.0];

h = X(2,2:end)/2 + X(2,1:end-1)/2;

odg4 = M * h' * g;


% 5.vprasanje
M = [1.0,2.0,5.0,1.4,1.0,2.0];
L = [1.0,1.5,1.0,1.5,1.0,1.0];
T0 = [2.3;0.0];

fun = @(h) kviz1_diskr_5([-1;-1],T0,[6;h],L,M);
odg5 = fzero(fun, 1) + 3;






