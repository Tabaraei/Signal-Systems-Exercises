clc;
clear;

% --------------------- part A ---------------------
u = @heaviside;
r = @(t) t.*u(t);
d = @(n) double(n==0);
x1 = @(t) r(t+1)-2*r(t)+r(t-1);
h1= @(n) d(n+2) - d(n) + d(n-2);
y1 = @(t) integral(@(T) x1(t-T).*h1(t) , -1,1);

t1 = -5:0.01:5;
for i=1:length(t1)
  f1(i) = y1(t1(i));
end
figure(1)
plot(t1,f1, 'color', [1 0.7 0]), grid, axis([-6 6 -1.2 1.2]);
title('(Convolution of x1 & h1)');
xlabel('-------------------------------------------- t --------------------------------------------');
ylabel('-------------------------------- y1(t) --------------------------------');


% --------------------- part B ---------------------
x2 = @(t) sin(pi*t);
h2 = @(t) u(t+0.5)-u(t-0.5);
y2 = @(t) integral(@(T) x2(t).*h2(t-T),-1,1);

t2 = -2:0.01:2;
for i=1:length(t2)
    f2(i)=y2(t2(i));
end
figure(2)
plot(t2,f2, 'color', [1 0.7 0]), grid, axis([-2.5 2.5 -1.2 1.2]);
title('(Convolution of x2 & h2)');
xlabel('-------------------------------------------- t --------------------------------------------');
ylabel('-------------------------------- y2(t) --------------------------------');