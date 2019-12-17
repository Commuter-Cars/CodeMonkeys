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
clear all;
clc;

H30=input("Choose the H30 value you wish to Evaluate ") % Prompt user for input on 
% H30 value, 340 mininmum, and 440 maximum

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

L40=input("Choose an L40 Angle Value to Evaluate ")

% Evaluate the center location of our 95th percentile eyellipses 

Cx=X95g-259.91472+10.281641.*(L40)-.032032.*(L40).^2;

Cz=H30+653.71757+.398747.*(L40)-.059301.*(L40).^2;

theta=deg2rad(6.4); % Specifies the Tilt angle of th Eyellipes from the horizontal

alpha=linspace(0,2*pi,1000);

Rx=99.45; % Major Radius/axis ;

Rz=43; % minor Radius/axis;

x=Rx.*cos(alpha).*cos(theta)-Rz.*sin(alpha).*sin(theta)+Cx;

z=Rx.*cos(alpha).*sin(theta)+Rz.*sin(alpha).*cos(theta)+Cz;


% This code specifies the location of the instramentation in the Tango Global
% cartesian reference frame.
zi=[708.66,627.29];
xi=[323.088,342.646];

I=polyfit(xi,zi,1);
i=linspace(342.646 ,323.088,100);
Ii=-4.1604.*i+2052;



%Px=[max(max(x))-11000,max(max(x))]
%Pz=[

