% input size m n; sparsity T; tolerance parameter noise_para
%% 
x_0 = zeros(n,1);
P = randperm(n);
x_0(P(1:T)) = abs(2*randn(T,1));
A = randn(m,n);
A = orth(A')';
noise = sqrt(noise_para);
noise_weight1 = rand(m,1);
noise_weight = noise_weight1./sqrt(noise_weight1'*noise_weight1);
h = A*x_0 + noise*noise_weight;
Q = A'*A;
b = -2*A'*h;
c = h'*h;