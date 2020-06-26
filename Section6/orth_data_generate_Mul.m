% input size n; sparsity T; number of quadratic constraints Const_num;
% tolerance level violation
%% target sparse solution
x_0 = zeros(n,1);
P = randperm(n);
x_0(P(1:T)) = abs(2*randn(T,1));
A = [];
h = [];
bnd = 1.1;
x_0 = x_0/norm(x_0);
%%
for i = 1:Const_num;
A_tem = randn(m,n);
%A_tem = orth(A_tem')';
%%
noise = sqrt(violation);
noise_weight1 = rand(m,1);
noise_weight = noise_weight1./sqrt(noise_weight1'*noise_weight1);
h_tem = A_tem*x_0 + noise*noise_weight;
%%
Q{i} = A_tem'*A_tem;
%[V1 D1] = eig(Q);
%Q = V1*abs(D1)*V1';
b{i} = -2*A_tem'*h_tem;
c{i} = h_tem'*h_tem-violation;
A = [A; A_tem];
h = [h;h_tem];
clear A_tem h_tem;
end
