clc; clear; close all;

syms x 

y_sim = x^2 * cos(x);
dy_sym = diff(y_sim);
d2y_sym = diff(y_sim,2);
d3y_sym = diff(y_sim,3);
d4y_sym = diff(y_sim,4);

domain = [0, 1];
x = linspace(domain(1),domain(2),100);

for i = 1:length(x)
    y(i) = double(subs(y_sim,x(i)));
    dy(i) = double(subs(dy_sym,x(i)));
    d2y(i) = double(subs(d2y_sym,x(i)));
    d3y(i) = double(subs(d3y_sym,x(i)));
    d4y(i) = double(subs(d4y_sym,x(i)));
end

figure
plot(x,y)
grid on
title("График функции")


eps = 0.1 * max(abs(y));
M_3 = max(abs(d3y));
h_opt_1 = (3*eps/M_3)^(1/3)

M_4 = max(abs(d4y));
h_opt_2 = (24*eps/M_4)^(1/4)

X = 0; i = 1;
while (X(i) < 1)
    i = i + 1;
    X(i) = X(i - 1) + h_opt_1;
end

func = @(x) x^2 * cos(x);


for i = 2:length(X)-1
    dy_num(i) = (func(X(i+1)) - func(X(i-1)))/(2*h_opt_1);
end

dy_num(1) = (func(X(2)) - func(X(1)))/(2*h_opt_1);
dy_num(length(X)) = (func(X(length(X))) - func(X((length(X)-1))))/(2*h_opt_1);

figure
grid on, hold on
plot(x,dy)
plot(X,dy_num)


for i = 2:length(X)-1
    d2y_num(i) = (func(X(i+1)) - 2*func(X(i)) + func(X(i-1)))/(h_opt_2^2);
end


figure
grid on, hold on
plot(x,d2y)
plot(X(2:length(X)-1), d2y_num(2:length(X)-1))