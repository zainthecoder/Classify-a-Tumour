function p = predict(theta, X)

m = size(X, 1); 

% You need to return p
p = zeros(m, 1);


%p=round((sigmoid(X*theta)));
p=sigmoid(X*theta);
 
for i=1:m
    if p(i)>=0.2
        p(i)=1;
    else
        p(i)=0;
    end
end    


end
