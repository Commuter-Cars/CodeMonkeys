% This File is an analysis and comparison of 4-Wheeled vehicles and equations 
% that attempt to describe thier preformance during the application of 
% Single Lane Change manuever: The action of applying steering in one direction
% to displace a vehicle laterally followed by counter steering to recover the 
% original direction of travel while maintaining directional control and minimizing
% displacment to approximatly one lane width.

% G.Zovak, Z.Papic. This equation comes from the Paper "Empirical Approach for 
% Determining Lane Change Distance at Obstical Avoidance manuever". The equation
% is Empirically derived and very similar to Limperts equaiton.
% Xe=Ce.*V.*sqrt(L./(g.*mu))
% where:
% Xe Longitudinal Distance traveld during the emergency lane change manuever.
% Ce=2.78 G.Zovaks constant 
% V=Vehicle Velocity ft/s
% L= Lateral distance traveled during lane change manuever
% g=acceleration of gravity 32.17 ft/s/s
% mu= coefficent of friction of dry roadway around .8

% Limperts equation for single lane change manuevers
% X2=C2.*V.*sqrt(L/ay) 

% C2=limperts constant about 2.6
% ay= Vehicle Lateral acceleration limit roughly .67*aymax and maximum is 
% roughly .85*aymax

% Dailys equation 
% Xd=C3.*V.*sqrt(L./(mu.*g))
% C3=Dailys constant=2.82


clear all;
clc;

Ce=2.78; %G.Zovak Constant
mu=.8; 
g=32.17;
fy=.65; % lateral acceleration, max value suggested by Limpert
ay=21.8756; % 85 percent of maximum lateral acceleration 
C2=2.6; % Limperts vehicle constant
C3=2.82; % Dailys constant

V=linspace(0,100,100); % ft/s
L=6.5; % ft

Xd=C3.*V.*sqrt(L./(g.*mu)); % Dailys Equation 

Xe=Ce.*V.*sqrt((L)./(g.*mu)); % ft G.Zovak 4-Wheeled Vehicles

X2=C2.*V.*(sqrt(L./ay)); % Limperts

mph=(60/88).*V;% converting ft/s to miles per hour


hold on ;
grid on;
plot(mph,Xd,"color",'b',";Daily;");
plot(mph,Xe,"color",'r',";G.Zovak;");
plot(mph,X2,"color",'k',";Limpert;");
title(" 4-Wheeled Vehicle Emergency Single Lane Change Comparisons L=6.5 ft");
xlabel("Vehicle Speed mi/h");
ylabel("Longitudinal Distance traveled during emergency lane change Manuever ft"); 
saveas(1,"Swerve_Comparisons","jpg");