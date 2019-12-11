%% This file contains an equation for 4 wheeled vehicle lane change manuever 
% Capabilities that was empirically derived, and is from the research paper
% "EMPIRICAL APPROACH FOR DETERMINING LANE CHANGE
%DISTANCE AT OBSTACLE AVOIDANCE MANOEUVRE"
% and equations empirically derived for motorcycles from the SAE paper "Time and Distance
% Required for a Motorcycle to turn away from an obstacle"
% Note: This specific program has an L value constrained to 6.5 ft. This is due to the 
% Fact that the data from Wade D. Bartletts expriement, and his derived equation 
% is only valid for an L dist of 6.5 ft. 

% Xe=Longitudinal Distance from start of manuever to clear obstical 4-wheeled vehicles ft
% Ce=2.78 unitless G.Zovak recomended coefficient for 4-Wheeled Vehicles
% L= Longitudinal distance of travel ft
% V= vehicles velocity ft/s
% g=32.17 ft/s/s acceleration of gravity
% mu=.8 coefficient of friction for a dry roadway
% X=Longitudinal distance (feet) from start of maneuver to clear obstacle motorcycles
% C1=Constant coefficient motorcycles =.45 (unitless) Limperts Recomended 
% C= Constant Coefficient motorcyles= .3, the minimum value suggested by Limpert
% fy=Turning lateral acceleration motorcycles (g-units) max possible suggested by Limpert
clear all;
C=.300; % Limperts maximum value for extreme motorcyle preformance
C1=.45; % Limperts recomened value for motorcycles
Ce=2.78; %G.Zovak Constant
mu=.8; 
g=32.17;
fy=.65; % lateral acceleration, max value suggested by Limpert
ay=21.8756; % 85 percent of maximum lateral acceleration (limperts Recomended)
C2=2.6; % Limperts vehicle constant
C3=2.82; % Dailys constant

V=linspace(0,100,100); % ft/s
L=6.5; % ft

Xd=C3.*V.*sqrt(L./(g.*mu)); % Dailys Equation for turnaway distance. commonly used 
% in crash reconstruction.

Xe=Ce.*V.*sqrt((L)./(g.*mu)); % ft G.Zovak 4-Wheeled Vehicles

%X=C.*V.*sqrt(L./fy); % ft Limpert High Preformance rider/motorcycle ie minimum turn dist

X1=C1.*V.*(sqrt(L./fy)); % ft Limperts recomended C value .45

X2=C2.*V.*(sqrt(L./ay)); % Limperts Recomended 4-Wheeled Vehicle Equation with ay=.72g
% Note: .72g is based on G.Zovak study on the average peak lateral acceleration for
% 4-Wheeled vehicles lane change manuvers. interestingly when Limperts equaion is 
% Plotted with this value it very closly matches G.Zovaks equation. which I belive 
% is a very good sign.

%Xc=sqrt((4.*V.^2.*L)./(mu.*g)-L.^2); % 4-Wheeled Vehicle emergency turn simplied equations 
%used for crash reconstruction From a paper written by Jon Neades Note: Based on 
% calculations of vehicle critical speed ie. max vehicle preformance befor loss
% of control of the vehicle. 

mph=(60/88).*V;% converting ft/s to miles per hour

%Xw=1.15.*mph+11.1; % Wade D. Bartletts Equation for turn away dist equation based on 
% his single study of 4 riders and 4 different motorcycles. Note: data only valid 
% for L dist of 6.5 feet
r=2.6.*mph-12;


hold on ;
grid on;
plot(mph,Xe,"color",'b',";4 Wheeled Vehicles(G.Zovak) Recomended;");
plot(mph,X1,"color",'g',";Mortor Cycles,C=0.45,(Limpert) Recomended C value;");
plot(mph,X2,"color",'r',";4 Wheeled Vehicles(Limpert) Recomended;");
plot(mph,Xd,"color",'k',";4 Wheeled Vehicles(Daily) Recomended;");
plot(mph,r,"color",'m',";Least Squarse Regression Shuman motorcyle data;");
title("Motorcycle and 4-Wheeled Vehicle Emergency Full Lane Change Comparisons L=6.5 ft");
xlabel("Vehicle Speed mi/h");
ylabel("Longitudinal Distance traveled during emergency lane change Manuever ft"); 
saveas(1,"Swerve_Comparisons","jpg");