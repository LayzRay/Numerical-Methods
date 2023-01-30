clear; clc; close all;

m = 3; % количество уравнений

%Генерация матриц
A = rand(m,m)*randi([-50,50]);
f = rand(m,1)*randi([-50,50]);

disp('Решение СЛАУ через обратную матрицу:')
X = inv(A)*f;
disp(X')

for i = 1:m
    temp = A;
    temp(:,i) = f;
    x(i) = det(temp)/det(A);
end
disp('Решение СЛАУ методом Крамера:')
disp(x)

D = [A f];

for i = 1:m-1
    [M,i_0] = max(D);
    temp = D(i,:);
    D(i,:) = D(i_0(i),:);
    D(i_0(i),:) = temp;
    
    D(i,:) = D(i,:)/D(i,i);
    for j = i+1:m
        D(j,:) = D(j,:) - D(i,:)*D(j,i);
        
    end
    
    
end
 D(m,:) = D(m,:)/D(m,m);

x(m) = D(m,m+1);
for i = m:-1:2
    D(1:i-1,i) = D(1:i-1,i) * x(i);
    x(i-1) = D(i-1,m+1) - sum(D(i-1,i:m));
end
disp('Решение СЛАУ методом Гаусса с выбором главного элемента:')
disp(x)

disp('Решение СЛАУ матричным делением:')
X = A\f;
disp(X')

disp('Решение СЛАУ с помощью функции rref:')
D = [A f];
AA = rref(D);
X = AA(:,end);
disp(X')

%%
A = rand(20,20)*randi([-200,200]);
disp('Значения матрицы X:')
X = rand(20,1)*randi([-50,50]);
disp(X') 

disp('Случайная матрица A:')
disp(A)

num_cond = cond(A)

disp('Случайная матрица A с большим числом обусловленности:') 
disp(A)
cond(A)


%%
disp('Значения матрицы f:')
f = A*X;
disp(f)

disp('Решение СЛАУ через обратную матрицу:')
X = inv(A)*f;
disp(X)

for i = 1:m
    temp = A;
    temp(:,i) = f;
    x(i) = det(temp)/det(A);
end
disp('Решение СЛАУ методом Крамера:')
disp(x)

D = [A f];

for i = 1:m-1
    [M,i_0] = max(D);
    temp = D(i,:);
    D(i,:) = D(i_0(i),:);
    D(i_0(i),:) = temp;
    
    D(i,:) = D(i,:)/D(i,i);
    for j = i+1:m
        D(j,:) = D(j,:) - D(i,:)*D(j,i);
        
    end
    
    
end
 D(m,:) = D(m,:)/D(m,m);

x(m) = D(m,m+1);
for i = m:-1:2
    D(1:i-1,i) = D(1:i-1,i) * x(i);
    x(i-1) = D(i-1,m+1) - sum(D(i-1,i:m));
end
disp('Решение СЛАУ методом Гаусса с выбором главного элемента:')
disp(x)

disp('Решение СЛАУ матричным делением:')
X = A\f;
disp(X')

disp('Решение СЛАУ с помощью функции rref:')
D = [A f];
AA = rref(D);
X = AA(:,end);
disp(X')