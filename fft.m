F_sample=5120;%采样频率
f_signal=100;%信号频率
dt=1/F_sample;%采样周期
N=1024;%采样点数
T=dt*N;%采样N点总花费时间
t=linspace(0,T,N);
y=10*sin(2*pi*f_signal*t);
figure(1);
plot(t,y);
title('signal：y=10*sin(2*pi*100*t)')
Y=fft(y,N);

A_real=real(Y);%实部 sin
A_imag=imag(Y);%虚部 cos
figure(2);
subplot(4,1,1);
plot(A_real);
title('FFT变换结果实部 sin')
subplot(4,1,2);
plot(A_imag);
title('FFT变换结果虚部 cos');
A_abs=abs(Y);% = sqrt(real(Y)^2+imag(Y)^2)
A_angle=angle(Y)*(180/pi);%相位角 = atan2(imag(Y)/real(Y))
subplot(4,1,3);plot(A_abs);title('幅频谱');
subplot(4,1,4);plot(A_angle);title('相频谱');

%fft变换后还需要处理
f=linspace(0,F_sample/2,N/2);%不显示负频率部分，x轴变换到真实频率，注意采样定理
A_abs_origin=abs(Y)/(N/2);%幅值量纲还原
figure(3);
subplot(4,1,1);
plot(f,A_abs_origin(1:N/2));
title('幅值量纲还原，X坐标换为频率')
subplot(4,1,2);
plot(f,A_angle(1:N/2));
title('相频谱')
A_POWER=A_abs.^2;%求功率
subplot(4,1,3);
plot(f,A_POWER(1:N/2));
title('功率谱')
A_POWER_LOG=20*log10(A_POWER);%对数功率谱，方便观察幅值相差大的信号
subplot(4,1,4);
plot(f,A_POWER_LOG(1:N/2));
title('对数功率谱');
