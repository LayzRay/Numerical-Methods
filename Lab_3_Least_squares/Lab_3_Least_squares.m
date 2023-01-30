% Аппроксимация данных методом наименьших квадратов

clear; clc; close all;

% Данные по варианту №6
X = -0.5:0.04:1.5;
Y = [1.6557    1.5859    1.9347    1.8121    1.9226    1.9367    1.9364    1.8522   1.8733    1.9431    1.8715    1.8908    2.1468    2.0052    1.8747    1.9859    1.8677    1.8331    1.9265    2.0296    1.9262    1.9555    1.7472    1.7900    1.7799    1.6532    1.6095    1.8002    1.6729    1.5712    1.6797    1.5855    1.4265    1.6228    1.4816    1.5650    1.4963    1.2806    1.1876    1.2788    1.2239    1.1453    1.2541    1.3299    1.1053    1.0565    1.1002    1.1773  1.0142    0.9708    1.0728];

%Будем находить коэффициенты уравнения линейной регрессии 
syms a_0 a_1 x

P = a_0 + a_1 * x; % P - Polynomial
F = 0;             % 

%Метод наименьших квадратов
for i = 1:10
    
    F = F + (Y(i) - subs(P,x,X(i)))^2;
    
end

[a_0,a_1] = solve(diff(F,a_0), diff(F,a_1));
a_0 = double(a_0);
a_1 = double(a_1);

disp('Уравнение линейной регресии:')
P = a_0 + a_1 * x;
disp(P)

%F = subs(F,a_0);
%F = subs(F,a_1);


hold on, grid on
plot(X(1:10),Y(1:10),"*")
plot(X(1:10),double(subs(P,X(1:10))))
title('Графики точек и линейной регрессии')


x_10 = X(1:10);
y_10 = Y(1:10);

disp('Среднее значение точек x и y:')
disp(mean(x_10))
disp(mean(y_10))

disp('Смещённая и несмещённая оценки среднеквадратичного отклонения x:')
disp(std(x_10,0));
disp(std(x_10,1));

disp('Смещённая и несмещённая оценки среднеквадратичного отклонения y:')
disp(std(y_10,0));
disp(std(y_10,1));

disp('Коэффициент корреляции:')
disp(corrcoef(x_10,y_10));

%Регрессионная матрица:
A_3 = [X(1:10).^0' X(1:10)' X(1:10).^2' X(1:10).^3'];
A_5 = [X(1:10).^0' X(1:10)' X(1:10).^2' X(1:10).^3' X(1:10).^4' X(1:10).^5'];
A_7 = [X(1:10).^0' X(1:10)' X(1:10).^2' X(1:10).^3' X(1:10).^4' X(1:10).^5' X(1:10).^6' X(1:10).^7'];

%Матрица коэффициентов
B_3 = (A_3' * A_3)^(-1) * A_3' * Y(1:10)';
B_5 = (A_5' * A_5)^(-1) * A_5' * Y(1:10)';
B_7 = (A_7' * A_7)^(-1) * A_7' * Y(1:10)';

%Регрессия со степенным базисом
P_3 = B_3(1) + B_3(2)*x + B_3(3)*x^2 + B_3(4) * x^3;
P_5 = B_5(1) + B_5(2)*x + B_5(3)*x^2 + B_5(4) * x^3;
P_7 = B_7(1) + B_7(2)*x + B_7(3)*x^2 + B_7(4) * x^3;

figure
hold on, grid on
plot(X(1:10),Y(1:10),"*")
plot(X(1:10),double(subs(P_3,X(1:10))))
title('Регрессия со степенным базисом')

figure

%Вычисление коэффициентов с помощью функции
B = polyfit(X(1:10),Y(1:10),3);
P_3 = B(4) + B(3)*x + B(2)*x^2 + B(1) * x^3;

hold on, grid on
plot(X(1:10),Y(1:10),"*")
plot(X(1:10),double(subs(P_3,X(1:10))))
title('Регрессия, вычисленная с помощью функции')

figure

plot(X(1:10),Y(1:10) - double(subs(P_3,X(1:10))))
title('График ошибок')
grid on