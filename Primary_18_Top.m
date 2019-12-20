% Primary_18_Top
% Expanded Packing Calcs referenced using the Global Cartesian Tengo cab Referece Frame
% The Tengo Cab Global Cartesian Referecne frames orgin is located in the verticle 
% z axis at the lower floor of the cab, and the front to back horizontal x location
% at the front extreme of the cab beyoned the accelerator and break pedal. Also note
% that since we are using the floor as the z=0 reference, the H30 values also corresponed
% to the H70 value for z location of the SgRP, definatly not standard practice, however
% very convienent in our case. All this is related in the 2d plane side view of the 
% Tango cab
% z=24.6966 from z=0 to bottom of instramentation
% z= 27.9 from z=0 to top of instramentation
% x=13.49 from x=0 to bottom of instrumentation
% x=12.72 from x=0 top of instramentaion
% This code checks for complience of instrumentation in the cabs Top view

clear all;
clc;

H30=input("Choose the H30 value you wish to Evaluate ") % Prompt user for input on 
% H30 value, 340 mininmum, and 440 maximum Note: I think that I will claime that
% The tangos H30 value is 380mm. a little lower than measured, but adds a buffer
% zone of clear compliance.

H30cm=H30/10;

PPAD=78.96-0.15.*(H30cm)-.0173.*(H30cm).^2; % Pedal Plane Angle degrees

PPA=deg2rad(PPAD); % Pedal Plane Angle Radians

L=203.*cos(PPA); % Ball of Foot Reference point lenght to heel mm

X=793.7+.903387.*H30-.00225518.*(H30).^2; % Defines the x location of the Accomidation 
% Tool Reference line aft of the Accomidation Ball of foot Referece point

X95=913.7+.672316.*H30-.0019553.*(H30).^2; % 95th percentile selected seat postion
% Curve where X95 is the location in mm aft of the Ball of foot Reference point

% The following if statments allow for the three directly measured Accomidation
% Ball of foot reference to be used for the H30 values of 340,390,and 440. If none
% of the directly measured values are used, then the linear inturpilated equation
% is used to evaluate AHR, which is obviously less accurate than using one of the
% directly measured values.

if H30==340
  AHR=238.15;
elseif H30==390
 AHR=269.875;
elseif H30==440
  AHR=314.325;
else
  AHR=.762.*(H30)-23;
 endif
 ABFR=AHR-L; % Accomidation Ball of foot Reference point X value from front 
% of cab in terms of H30 mm in the Global cartesian reference frame mm

Xg=X+ABFR; % Class A vehicle Accomidation Tool Referecne line in The Tengo Cab 
% Global Cartesain Coordinate system

X95g=X95+ABFR; % 95th percentile selected seat postion curve in the Tengo cab Global
% Cartesian Coordinate system

L40=input("Choose an L40 Angle Value to Evaluate ")% evaluating on the reasonable
% to the extreme, 25 degrees very common value, 5 degrees is extraordinarly lower
% and 40 degrees is rediculously high.

% Evaluate the center location of our 95th percentile eyellipses 

Cx=X95g-259.91472+10.281641.*(L40)-.032032.*(L40).^2;

% Y location of the two eye ellipses in the Tangos Global Carteesian reference frame
% which the zero Y location corresponds directly to the longitudinal axis of the
% vehicle 

Cy1=32.5;

Cy2=-32.5;

theta=deg2rad(0); % Specifies the Tilt angle of th Eyellipes from the horizontal

alpha=linspace(0,2*pi,1000);

Rx=99.45; % Major Radius/axis ;

Ry=43; % minor Radius/axis;

x=Rx.*cos(alpha).*cos(theta)-Ry.*sin(alpha).*sin(theta)+Cx;

y1=Rx.*cos(alpha).*sin(theta)+Ry.*sin(alpha).*cos(theta)+Cy1;

y2=Rx.*cos(alpha).*sin(theta)+Ry.*sin(alpha).*cos(theta)+Cy2;

Ixloc=342.646; % Specifies the location of the instramentation in the x

% Specifies the end points of the instramentation in the y axis.
Iyloc1=-78.2365;
Iyloc2=78.2365;

Ex1=32.5;
Ex2=-32.5;
ang1=deg2rad(30);
ang2=deg2rad(20);

xminloc=min(min(x));

Y12=Ex1+(xminloc/tan(ang1));
Y21=Ex2-(xminloc/tan(ang2));


Ix=[342.646,342.646];
Iy=[-78.2365,78.2365];


X=[xminloc,0];

Y1=[Ex1,Y12];
Y2=[Ex2,Y21];


hold on;
grid on;
axis equal;

plot(y1,x,'lineWidth',2,'color','k',y2,x,'lineWidth',2,'color','k');
plot(Iy,Ix,"color",'r','lineWidth',5,";Group 1 Intrumentation;");
plot(Y1,X,"color",'b',"linestyle","--",";Boundary of Non-complience;");
plot(Y2,X,"color",'b',"linestyle","--");


xlim([-600 600]);
ylim([0 1200]);
xlabel("Y mm");
ylabel("X mm");
