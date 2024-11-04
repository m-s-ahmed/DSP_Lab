%Load a plain signal
close all; clc;

load('plain')
s=plain;
subplot(3,2,1);
plot(s);
xlabel('Plain Signal');

%Load noise signal

x=load('sn_5');
subplot(3,2,2);
plot(x);
xlabel('sn5');

y=load('sn10');
subplot(3,2,3);
plot(y);
xlabel('sn10');

z=load('sn15');
subplot(3,2,4);
plot(z);
xlabel('sn15');

m=load('sn0');
subplot(3,2,5);
plot(m);
xlabel('sn30');

p=load('sn20');
subplot(3,2,6);
plot(p);
xlabel('sn20');
