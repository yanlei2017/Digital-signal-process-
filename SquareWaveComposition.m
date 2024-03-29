N=1024; T=2;
x=linspace(0,T,N);
y1=sin(2*3.14*x);
subplot(4,1,1);
plot(x,y1);
title('f=1');
y2=y1+1/3*sin(3*2*3.14*x);
subplot(4,1,2);
plot(x,y2);
title('f=1 + f=3');
y3=y2+1/5*sin(5*2*3.14*x);
subplot(4,1,3);
plot(x,y3);
title('f=1 + f=3 + f=5');
y4=y3+1/7*sin(7*2*3.14*x);
subplot(4,1,4);
plot(x,y4);
title('f=1 + f=3 + f=5 + f=7');