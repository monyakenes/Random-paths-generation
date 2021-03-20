clear 
clc
% randn('state', 100)

S0 = 1;
mu = 0.2;
sigma = 0.3;
T = 3;
L = 1000;
dt = T/L;

time = [0:dt:T];
M =10000;

for j = 1:M
Z = randn(1, L);
S(j,1) = S0;
for i = 1:L
    S(j, i+1) = S(j, i) * exp( (mu - 0.5 * sigma^2) * dt + sigma * sqrt(dt) * Z(i));  
end
% plot(time,S(j, :), 'b')
% hold on 
end

%% Expected value of S(t)
expected_value = mean(S,1);
plot(time, expected_value,'r')
hold on
plot(time, S0 * exp(mu * time), 'g')

