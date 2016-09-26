t = 0:0.01:1;     % generate vector

save t.vect t;   % save data
load('t.vect');  % load data

y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);

figure(1);
plot(t, y1);
hold on;% wait to plot next figure
plot(t, y2, 'r'); % red color
xlabel('time');
ylabel('value');
legend('sin', 'cos');
title('my plot');


figure(2);
subplot(1,2,1);plot(t, y1);
subplot(1,2,2);plot(t, y2,'r');




