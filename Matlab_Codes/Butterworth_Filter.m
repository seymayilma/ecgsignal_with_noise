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

%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rp = 0.3; %ripple
Rs = 40;
Wp = [0.4];
Ws = [0.6];

%Butterworth Filter

FilterType = 'Butterworth Filter';
[N, Wpe] = buttord(Wp, Ws, Rp, Rs);

[b,a] = butter(N, Wpe);
snr = 22;
x1_n = awgn(y,snr);
y2 = filter(b,a,x1_n);
subplot(3,1,3);
plot(y2); title('Butterworth Filter');