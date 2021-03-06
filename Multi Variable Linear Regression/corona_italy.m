%% Initialization
clear ; close all; clc
data = load('corona_data_italy.txt');


for i=1:size(data(:,1))
    data(i,1) = i
end
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples


%% =================== Part 3: Cost and Gradient descent ===================

for i=1:m
    Daycount(i)=i
end
Daycount=Daycount';
X = [X, X(:,1).^2]
X = [X, X(:,1).^3]
X = featureNormalize(X) %Normalize before adding BIAS
X = [ones(m, 1), X]; % Add a column of BIAS

theta = zeros(4, 1); % initialize fitting parameters



% Some gradient descent settings
iterations = 1000;
alpha = 0.1; %can be editted


fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);


% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '.')
plot(X(:,2), y, '.')
ylabel('Case Number');
xlabel('Day');
legend('Hypothesis', 'Train Data')
hold off % don't overlay any more plots on this figure

%Prediction for next day
fprintf('Prediction for next day:\n');
fprintf('%f\n', [1,m+1,(m+1)^2,(m+1)^3]*theta);

predlen= input("How many days you want me to predict?: \n");
predict= future_prediction(predlen,m,theta);

% Plot the predictions
figure;
hold on; % keep previous plot visible
plot(linspace(1,predlen,predlen), predict, '.')
ylabel('Case Number');
xlabel('Day');
legend('Predictions')
hold off % don't overlay any more plots on this figure

disp(predict)

%% Things to change for new country:
% 1) Load data txt name

%% Things to change for more features:
% 1) X and theta initializations
% 2) Iteration and alpha values
% 3) future_prediction() function
