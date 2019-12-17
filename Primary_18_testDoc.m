% test for smallest z value


clear all;
%clc;

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

Rx=99.45; % Major Radius/axis ;

Rz=43; % minor Radius/axis;


alphazmin=4.45295;
theta=deg2rad(6.4);


zmin=Rx.*cos(alphazmin).*sin(theta)+Rz.*sin(alphazmin).*cos(theta)+Cz;% might be the location
% of smallest z value of ellipse

xloczmin=Rx.*cos(alphazmin).*cos(theta)-Rz.*sin(alphazmin).*sin(theta)+Cx;% the x location of that
% smallest value

alphaxmax=6.23287;

xmax=Rx.*cos(alphaxmax).*cos(theta)-Rz.*sin(alphaxmax).*sin(theta)+Cx;

zlocxmax=Rx.*cos(alphaxmax).*sin(theta)+Rz.*sin(alphaxmax).*cos(theta)+Cz;

alphaxmin=3.09442;

xmin=Rx.*cos(alphaxmin).*cos(theta)-Rz.*sin(alphaxmin).*sin(theta)+Cx;

zlocxmin=Rx.*cos(alphaxmin).*sin(theta)+Rz.*sin(alphaxmin).*cos(theta)+Cz;