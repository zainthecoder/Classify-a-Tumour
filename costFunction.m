function [J, grad] = costFunction(initial_theta, X, y)


m = length(y);

% You need to return J and grad
J = 0;
grad = zeros(size(initial_theta));



h=sigmoid(X*initial_theta);


%cost function for logistic regression
J=1/m*((-1*y'*log(h))-((1-y)'*log(1-h)));
fprintf('cost %f\n',J);
grad = (1/m)*(X'*(h-y));

%fprintf('grad %f\n',grad);
cost=J;

end
