function W = potencialna(h)
  g = 9.81;
  M = [1,2,1,2,1,2,1,2];
  L = [1,1.5,1,1.5,1,1.5,1,1.5];
  obesisceL = [1;5];
  obesisceD = [6;2];
  s = [2.543175828723522; 0.275821184647270];
  X1 = diskrVeriznica([-1;-1],obesisceL,[s(1);s(2)+h],L(1,1:4),M(1,1:4));
  X2 = diskrVeriznica([-1;-1],[s(1);s(2)+h],obesisceD,L(1,5:8),M(1,5:8));
  h1 = X1(2,2:end)/2 + X1(2,1:end-1)/2;
  h2 = X2(2,2:end)/2 + X2(2,1:end-1)/2;
  W = M(1,1:4) * h1' * g + M(1,5:8) * h2' * g;
       
end