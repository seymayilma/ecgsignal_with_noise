val1=transpose(val);
t=0:10/length(val1):10;
t=t(1:length(val1))
figure, subplot(3,1,1);
plot(t,val1)
legend('Original Signal of ECG')
y = awgn(val1,10,'measured');
subplot(3,1,2);
plot(t,[val1 y])
legend('Signal with AWGN')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Implementation of Moving Average Filter or Smoothing Filter
% Algorithm:
%               X(n-1) + X(n) + X(n+1)
%    Y(n) =     ----------------------   
%                         3
%              here, X(n) = noise effected signal
%                    Y(n) = Smoothed or averaged signal
% therefore,
t1= 0:0.001:1;
[m,n] = size(t);
y2 = zeros(m,n);
for i = 2:(n-1)
    y2(i) = (y(i-1) + y(i) + y(i+1))/3;
end
subplot(3,1,3);
plot(t,y2); title('Smoothed Signal');