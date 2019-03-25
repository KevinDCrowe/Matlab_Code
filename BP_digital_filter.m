clear all, clc
k=4;
N=2^k ;
fl=floor(.3*N) ; %lower cutoff frequency
fh=floor(.4*N) ; %upper turnon frequency
ftl=floor(.35*N); %lower turn on frequency 
fth=floor(.45*N);
G=1; %Gain of BP filter
G2=0; %Gain of the test signal


ft=1:N;

f=1:N ;
i=1;

while i<N+1;
    f(i)=G;
    ft(i)=G2;
    i=i+1;
end
f(fl:fh)=0;
f(N-fh:N-fl)=0;
ft(ftl:fth)=1;
ft(N-fth:N-ftl)=1;

at=real(ifft(f));
a(1:N/2)=at(N/2+1:N);
a(N/2+1:N)=at(1:N/2);

ct=real(ifft(ft));
c(1:N/2)=ct(N/2+1:N);
c(N/2+1:N)=ct(1:N/2);
i=1;

y= filter(1,a,c);
yf=fft(y);
%{
while i<N+1
    a(i)=round(8*a(i));
    c(i)=round(16*c(i));
    y(i)=round(y(i)/4);
    i=i+1;
end
%}
a
c
y

af=abs(fft(a))
cf=abs(fft(c))
yf=abs(fft(y))

%bt=imag(ifft(f));
%b(1:N/2)=bt(N/2+1:N);
%b(N/2+1:N)=bt(1:N/2);
%{
hold on
figure(1)
title('filter')
plot(a,'g');
plot(f,'r');
%plot(b);

figure(2)
title('Data')
stem(c,'g')
plot(ft,'r')

figure(3)
title('Output')
plot(y,'g')
figure(4)
plot(yf,'r')
%}