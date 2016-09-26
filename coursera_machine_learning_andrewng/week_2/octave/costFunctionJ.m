function J = costFunctionF(X, y, theta)

m = size(X, 1);    % number of training examples
predict = X*theta;
sqrErr = (predict-y).^2;

J = (1/(2*m))*sum(sqrErr);


