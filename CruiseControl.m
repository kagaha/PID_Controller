Kp = 1;
Ki = 1;
Kd = 1;
%Trnasfer Function
s = tf('s');
C = Kp + Ki/s + Kd*s;
m = 1000;
b = 50;
r = 10;
s = tf('s');
P_cruise = 1/(m*s + b);
%Step response with p-controller
Kp = 100;
C = pid(Kp);
T = feedback(C*P_cruise,1);
t = 0:0.1:20;
figure(1);
step(r*T,t);
axis([0 20 0 10]);
%Step resposne with pi-controller
Kp = 600;
Ki = 1;
C = pid(Kp,Ki);
T = feedback(C*P_cruise,1);
figure(2);
step(r*T,t);
axis([0 20 0 10]);
%Step response with pid-controller
Kp = 600;
Ki = 100;
Kd = 10;
C = pid(Kp,Ki,Kd)
T = feedback(C*P_cruise,1);
figure(3);
step(T,t);
axis([0 20 0 10]);