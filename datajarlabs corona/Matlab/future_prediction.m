function future = future_prediction(lenght,m,theta)
%FUTURE_PRED�CT�ON predicts future case numbers starting from m+1
%   Detailed explanation goes here



for i=1:lenght
    future(i) = [1,m+1,(m+1)^2,(m+1)^3,(m+1)^4]*theta;
    m = m+1;
end
end

