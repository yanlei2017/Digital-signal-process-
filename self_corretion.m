N=1024;
f_signal1=200;
f_signal2=400;
T=0.1;
t=linspace(0,T,N);
signal1=2*sin(2*pi*f_signal1*t);
signal2=2*cos(2*pi*f_signal2*t);
subplot(4,1,1);
plot(t,signal1);
title('Original signal');
noise=randn(1,N);
subplot(4,1,2);
plot(t,noise);
title('white noise ');
signal_add_noise=signal1+noise;
subplot(4,1,3);
plot(t,signal_add_noise);
title('Original signal + white noise ');
t_correct=linspace(-T,T,2*N-1);
correlation_x=xcorr(signal_add_noise,'unbiased');
subplot(4,1,4);
plot(t_correct,correlation_x);
title('Cross-correlation of noised signal');
figure;
correlation_x_y=xcorr(signal1,signal2);
subplot(3,1,1);
plot(t,signal1);
subplot(3,1,2);
plot(t,signal2);
subplot(3,1,3);
plot(t_correct,correlation_x_y);




