function no_of_false = count_false(p,y)

m=size(y,1);
no_of_false=0;

for i=1:m
    if p(i)==1 & y(i)==0
        no_of_false=no_of_false+1;
    elseif p(i)==0 & y(i)==1 
        no_of_false=no_of_false+1;
    end
end



end