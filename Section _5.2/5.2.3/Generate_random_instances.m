%
clear all; close all;
%% signal generationg
choice_transform = 1;      % 1 DCT 0 FFT
choice_Phi = 0;      
%-----------------------
n = 500;
t = [0: n-1];
f = cos(4*pi/256*t) + sin(6*pi/256*t); 
%----------------------- generate time region sparse signal
% n = 512;
% s = 25;
% tmp = randperm(n);    
% f = zeros(1,n);
% f(tmp(1:s)) = randn(s,1); 

%-------------------------------
n = length(f);
a = 0.2;           
m = double(int32(a*n));
%--------------------------------------
%  tmp = randperm(n);    
%     f(tmp(1:s)) = randn(s,1); 
%----------------------------------------------------------------------------------
switch choice_transform
    case 1
        ft = dct(f);
        disp('ft = dct(f)')
    case 0
        ft = fft(f);
        disp('ft = fft(f)')
end
 
disp(['Signal Sparsity:',num2str(length(find((abs(ft))>0.1)))])
 
figure('name', 'A Tone Time and Frequency Plot');
%subplot(2, 1, 1);
plot(f);
xlabel('Time (s)'); 
% ylabel('f(t)');
%% 
% subplot(2, 1, 2);
%  
% switch choice_transform
%     case 1
%         plot(ft)
%         disp('plot(ft)')
%     case 0
%         plot(abs(ft));
%         disp('plot(abs(ft))')
% end
% xlabel('Frequency (Hz)'); 
% ylabel('DCT(f(t))');
%% ?????????????
%--------------------------???????????---------------------
switch choice_Phi
    case 1
        Phi = PartHadamardMtx(m,n);      
    case 0
        Phi = sqrt(1/m) * randn(m,n);    
end
f2 = (Phi * f')';                 
% f2 = f(1:2:n);
switch choice_transform
    case 1
        Psi = dct(eye(n,n));            %Psi = dctmtx(n);
        disp('Psi = dct(eye(n,n));')
    case 0
        Psi = inv(fft(eye(n,n)));   
        disp('Psi = inv(fft(eye(n,n)));')
end
A = Phi * Psi;  

%%
% f = cos(8*pi/256*t) + sin(2*pi/256*t);