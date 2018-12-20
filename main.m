clear ; close all; clc

data=xlsread('Potential datasets for recruitment.xlsx','Dataset 2');
X = data(:, [2,3,4,5,6,7,8,9,10]); y = data(:, 11);

[m, n] = size(X);

% converting 2=>0 and 4=>1

for i=1:m
    if y(i)==2
        y(i)=0;
    else 
        y(i)=1;
    end   
end   

% Add intercept term to x and X_test
X = [ones(m, 1) X];
X_train = X(1:420,:);
y_train = y(1:420,:);
X_test = X(421:699,:);
y_test = y(421:699,:);
% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Compute initial cost and gradient
[cost, grad] = costFunction(initial_theta, X_train, y_train);
fprintf('\n');

options = optimset('GradObj', 'on', 'MaxIter', 100);

%  Run fminunc to obtain the optimal theta ,this function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X_train, y_train)), initial_theta, options);

fprintf('\n');
fprintf('test data\n');

p=zeros(size(X_test,1),1);
p =predict(theta,X_test);

fprintf('Test Accuracy: %f\n', mean(double(p == y_test)) * 100);
fprintf('\n');

no_of_false=count_false(p,y_test);
fprintf('no of false negative and false positive:%f',no_of_false);
