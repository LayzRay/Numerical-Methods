clc; clear; close all;

f = @(x) cosh(x)./(1-x).^2;

d1 = 0.0001;
m = 10;

int = integral(f,0,d1) + integral(f,0,d1)

%%
clc; clear; close all;

 eps = 10e-10;

f = @(x) cosh(x)./(1-x).^2;
%f2 = @(x) sin(x).*sinh(x);
a = integral(f,0,1-eps)
b = integral(f,1+eps,3)
nesob = integral(f,0,3)

sum_1 = a+b


x = linspace(0,1-eps,100);
h = x(2) - x(1);

int_1 = 0; int_2 = 0; int_3 = 0;

for i = 1:length(x)-1
    
   int_1 = int_1 + f(x(i))*h;
    
end
int_1

x = linspace(1+eps,3,100);
h = x(2) - x(1);

for i = 2:length(x)
    
   int_2 = int_2 + f(x(i))*h;
    
end
int_2
sum = int_1 + int_2


integ = 0; x = linspace(0,1-eps,100);
h = x(2) - x(1); v = 1/(6*length(x));

for i=1:1:((length(x)/2)-1) %сам алгоритм Симпсона

x_1=0+2*h*i;

integ=integ+2*f(x_1)+4*f(x_1+h);

end
integ

integ2 = 0; x = linspace(1+eps,3,100);
h = x(2) - x(1); v = 1/(6*length(x));
for i=1:1:((length(x)/2)-1) %сам алгоритм Симпсона

x_1=1+eps+2*h*i;

integ2 =integ2+2*f(x_1)+4*f(x_1+h);

end
integ2

sum = integ + integ2

%%
clc; clear; close all;
% не стандартным оператором

F = @(x) cosh(x)./(1-x).^2; %функция

a=0; %пределы интегрирования
eps = 10e-16;

b=1-eps;

n=100; %количество частей деления

h=(b-a)/n; %определяем шаг

integ = F(a);

for i=1:1:((n/2)-1) %сам алгоритм Симпсона

x=a+2*h*i;

integ=integ+2*F(x)+4*F(x+h);

end

integ=h*integ/3
%%

for i = 2:length(x)
    
   int_2 = int_2 + f(x(i))*h;
    
end

for i = 2:length(x)
    
   int_3 = int_3 + (f(x(i-1)) + f(x(i)))/2*h;
    
end

int_1
int_2 
int_3

syms x

f = 1/sqrt(1+x^2);

df = diff(f);
d2f = diff(f,2);
x = linspace(0,1,15);
for i = 1:length(x)
        d(i) = double(subs(df,x(i)));
end
M = max(abs(d))

R = 0.5 * M*h

for i = 1:length(x)
        d2(i) = double(subs(d2f,x(i)));
end
M2 = max(abs(d2))

R = 1/12 * M2*h^2

quad(@(x) 1./sqrt(1+x.^2),0,1,10^(-3))

f = @(x) 1./sqrt(1+x.^2);
x = linspace(0,1,15);

trapz(x,f(x))

syms x

f = 1/sqrt(1+x^2);
double(int(f,0,1))