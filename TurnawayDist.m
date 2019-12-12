% One half lane change or Critical Turnaway manuever comparisons equations between
% MotorCycles and 4-Wheeled Vehicles. This Manuever and the equations that are 
% attempting to define them are measureing the longitudinal distance traveled during
% the conduction of said manuever, details on the different equations and thier 
% Origin are shown below.

% Daily's Equation for Critical Turnaway distance (4-Wheeled vehcles)
% Xd=V.*sqrt((2.*dy)/(mu.*g)) 
% Where
% Xd=Longitudinal distance traversed during the turnaway manuever
% V=Vehicle Velocity ft/s
% We will be using a mu of .8 for the moment( this may be invalid, and we will want
% to play with this here. My source for this equation says we should use mu subscript
% m, which is appearetnly the maximum coefficent of friction between the tire and 
% Roadway
% dy=Lateral displacment for critical turnaway (might use 6.5) I will need to 
% pay attenction to this value, which will be similar to the L value of later
% equations.
% g is obviously acceleration of gravity

% Limperts Equation for Critical Turnaway distance for (4-Wheeled Vhicles)

% Xl=V.*sqrt((2.*dy)/(.85.*mu.*g))
% Note: the values are all the same other than the .85, or 85 percent of maximum
% lateral acceleration used. recomended for critical turn away values  ( I actually
% changed this value to .67 percent of maximum lateral acceleration used.)

% Limperts Equation for Critical Trunaway distance for (Motorcyclels) comes highly
% recomended
% Xu=Cl.*V.*sqrt(L/fy)
% Cl=limperts constant .45-.3 Ill play with these values a bit.
% L= lateral displacement during manuever
% fy=turning lateral acceleration in g units .65g is maximum value, and the one we
% we will use here

% Wade D. Bartlett empirically derived equation Note: data only valid for a lateral
% displacement of 6.5 ft for turnaway manuver (empirically derived equation)
% From SAE Paper "Time and Distance Required for a MotorCycle to Turn away from
% an Obstacle"
% Xw=1.15mph+11.1

% Carl. F Shumans data... I did a least squars best fit line to the Shumans
% data for dist for wheels to clear obstacle, which I belive is the same as the 
% turn away distance. In anycase the equation seems to agree well with the other
% turn away distance equations for MotorCycles.
% y=1.3.*mph+6.833

clear all;
clc;

L=6.5 ;% lateral displacment feet

dy=6.5; % Lateral displacment feet

mu=.8 ;% coefficent of friction for a dry roadway

g=32.17; % ft/s/s

Cl=.30 ;% limperts constant motorcycles

fy=.65 ;% limperts lateral acceleration value motorcycels 

V=linspace(0,100,100); % Vehicle veleocity ft/s

Xd=V.*sqrt((2.*dy)/(mu.*g)); % Dailys equation 4-Wheeled Vehicels 

Xl=V.*sqrt((2.*dy)/(.67.*mu.*g)); % Limperts equation 4-Wheeled Vehicles 

Xu=Cl.*V.*sqrt(L/fy); % Limperts equation motorcycles

mph=(60/88).*V; % convert ft/s to mph

Xw=1.15.*mph+11.1; % Wade D. Bartletts equation

y=1.3.*mph+6.833; % Least Squars regression of Shuman Data

hold on;
grid on;

plot(mph,Xd,"color",'b',";4-Wheeled Vehicles (Daily);");
plot(mph,Xl,"color",'r',";4-Wheeled Vehicles (Limpert);");
plot(mph,Xu,"color",'k',";MotorCycles (Limpert);");
plot(mph,Xw,"color",'g',";MotorCycles (Bartlett);");
plot(mph,y,"color",'y',";MotorCycles (Shuman Data);");
xlabel("mi/h");
ylabel("Longitudinal Distance traveled during Turnaway Manuever ft");
title("Turnaway Distance vs. Vehicle Speed");

