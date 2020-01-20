%Joe Herrmann
%EE-206 Homework
clear,clc,format compact
k = 10^3;
m = 10^-3;
n = 10^-9;
p = 10^-12;
w = 2*10^6;
jw = 1j*w;
%Problem #1
%Components
r1 = 10*k;
c1 = 50*p;

r2 = 4*k;
c2 = 125*p;

r3 = 8*k;
l3 = 4*m;

r4 = 4*k;
c4 = 125*p;
%Voltage input converted to Rectangular
Vi = Polar_2_Rect(15*m,-30);
%Converting to Impedence
Zr1 = r1;
Zc1 = 1/(jw*c1);
Y1 = (1/Zr1)+(1/Zc1);
Z1 = 1/Y1;

Zr2 = r2;
Zc2 = 1/(jw*c2);
Y2 = (1/Zr2)+(1/Zc2);
Z2 = 1/Y2;

Zr3 = r3;
Zl3 = jw*l3;
Z3 = Zr3+Zl3;
Y3 = 1/Z3;

Zr4 = r4;
Zc4 = 1/(jw*c4);
Z4 = Zr4+Zc4;
Y4 = 1/Z4;

Za = Z3+Z4;
Ya = 1/Za;

%KCL at Node Vx
Vx = (Vi*Y1)/(Y1+Y2+Ya);

%KCL at Node Vo
Vo = (Vx*Y3)/(Y3+Y4);

%Determine the gain
Av = Vo / Vi;

%Convert Vo from Rectangular to Polar/Time Domain
Print_Title('EE-206 Homework #1');

Print_Polar_Unit('~Vo',Vo,'V');
Print_Polar_Unit('~Av',Av,'V');

%Problem #2
w = 5*10^5;
jw = 1j*w;

r1 = 1*k;

r2 = 5*k;
l2 = 10*m;

r3 = 1.5*k;
l3 = 4*m;
c3 = 4*n;

r4 = 4*k;
c4 =250*p;

r5 = 4*k;
c5 = 500*p;

c6 = 500*p;

Z1 = r1;

Zr2 = r2;
Zl2 = jw*l2;
Z2 = Zr2 + Zc2;
Y2 = 1/Z2;

Zr3 = r3;
Zl3 = jw*l3;
Zc3 = jw*c3;
Z3 = Zr3 + Zl3 + Zc3;
Y3 = 1/Z3;

Zr4 = r4;
Zc4 = 1/(jw*c4);
Y4 = (1/Zr4)+(1/Zc4);
Z4 = 1/Y4;

Zr5 = r5;
Zc5 = 1/(jw*c5);
Z5 = Zr5+Zc5;
Y5 = 1/Z5;

Z6 = 1/(jw*c6);
Y6 = 1/Z6;

%Converting Input Voltage to Rectangular
Vg1 = Polar_2_Rect(150*m,15);
Vg2 = Polar_2_Rect(200*m,-60);

A = [Y1+Y2+Y3, -Y2     , -Y3;
     -Y2     , Y2+Y4+Y5, Y5;
     -Y3     , -Y5     , Y6+Y5+Y3];
 B = [Vg1*Y1;
           0;
      Vg2*Y6];
  
 C = inv(A)*B;

 V1 = C(1);
 V2 = C(2);
 V3 = C(3);
Print_Break
Print_Polar_Unit('V1(t)',V1,'V');
Print_Polar_Unit('V2(t)',V2,'V');
Print_Polar_Unit('V3(t)',V3,'V');

Print_End