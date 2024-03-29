function [kontrolne1,kontrolne2] = sub_demo(b,c,risanje)
% SUB_DEMO demonstrira en korak subdivizije za ravninsko
% Bezierovo krivuljo. Pri tem je b tabela 2x(n+1) kontrolnih tock.
% c je subdivizijski parameter 0 <= c <= 1.
% povzeto od https://github.com/nikerzetic/matematicno-modeliranje/tree/master

n = size(b,2);
kontrolne1 = zeros(2,n);
kontrolne2 = zeros(2,n);

if risanje
    plotBezier(b);
end

for i = 2:n
    kontrolne1(:,i-1) = b(:,1);
    kontrolne2(:,i-1) = b(:,end);
    b = (1-c).*b(:,1:end-1) + c.*b(:,2:end);
end

kontrolne1(:,end) = b(:,end);
kontrolne2(:,end) = b(:,end);
kontrolne2 = flip(kontrolne2,2);

if risanje
   plot(kontrolne1(1,:),kontrolne1(2,:),'r');
   hold on;
   plot(kontrolne2(1,:),kontrolne2(2,:),'b');
end

end