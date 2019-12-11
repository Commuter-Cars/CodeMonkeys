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
H30=linspace(340,440,100); % Spectrum of H30 Referece points Reasonable for the 
% Tengo cab Construction in mm

H30cm=linspace(34,44,100); % H30 in centimeters

PPAD=78.96-0.15.*(H30cm)-.0173.*(H30cm).^2; % Pedal Plane Angle degrees

PPA=deg2rad(PPAD); % Pedal Plane Angle Radians

L=203.*cos(PPA); % Ball of Foot Reference point lenght to heel mm

X=793.7+.903387.*H30-.00225518.*(H30).^2; % Defines the x location of the Accomidation 
% Tool Reference line aft of the Accomidation Ball of foot Referece point

X95=913.7+.672316.*H30-.0019553.*(H30).^2; %95th percentile selected seat postion
% Curve where X95 is the location in mm aft of the Ball of foot Reference point

AHR=.762.*(H30)-23; % Accomidation heel reference point approximated using linear 
% Regression (Least Squares) from the three directly measured data points distance x from front
%  of cab global cartesian reference frame in terms of H30 mm, Note: If our model does
% not perfectly reflect reality, it is here that one should look. I did not collect
% very many data points, and the linearity assumption of the AHR position in terms
% H30 is just that, an assumption. however, I do belive that this assumption makes
% perfect sense, but you may disagree, and that is fine, and I would love to hear
% your critism. Thanks, and have a nice day!

ABFR=AHR-L; % Accomidation Ball of foot Reference point X value from front 
% of cab in terms of H30 mm in the Global cartesian reference frame mm

Xg=X+ABFR; % Class A vehicle Accomidation Tool Referecne line in The Tengo Cab 
% Global Cartesain Coordinate system

X95g=X95+ABFR; % 95th percentile selected seat postion curve in the Tengo cab Global
% Cartesian Coordinate system

% Lets begin to locate the centroid of the eyellipes in the side view two dimensional
% plane in the Tangos Global coordinate system, ie the plane that this entire octave code thing is in.;)
% These calcs are for
% seat track travel > 133 mm, if this doesnt make sense to you then I suspect you
% have not spent the last two weeks reading SAE documents, and I would recommend
% you change that in an effort to understand what I'm doing. Our seat track travel
% is 215.9 mm, feel free to measure it yourself if you have concerns.  

L40=linspace(5,40,100); % L40 is the seat back angle in degrees, I need to play with this value further to better understand
% Its effect on the overall locations of the eyellipes, however, 25 degrees is 
% pretty standard, and for now this is what we will use.
L40_2=15;



%Ecenx_2=X95g-259.91472+10.281641.*(L40_2)-.032032.*(L40_2).^2;

%Ecenz_2=H30+653.71757+.398747.*(L40_2)-.059301.*(L40_2).^2;

Ecenx=X95g-259.91472+10.281641.*(L40)-.032032.*(L40).^2;

Ecenz=H30+653.71757+.398747.*(L40)-.059301.*(L40).^2; % please note that the 
% H30 value being used here is also our H70, or Z location of the SgRP, which in
% our vehicle Reference frame H30=H70. Thanks, and have a nice day!

pkg load geometry; % Lets use this really awesome Geometry package that someone 
% was nice enough to put together. All praise the unsung heroes of the open source world!

% These next few lines of code is where I am going to build the 95th percentile
% Eyellipeses using the drawEllipes command. The first two inputs from left to right
% specify the x, and z locations in our vehicle referece frame, and the next two inputs 
% specify the major and minor axis dimensions respectivly. The dimensions currently inputed
% are that of the SAE 95th percentile eyellipse. the last value indicates the tilt
% in degrees. I will start by drawing three ellipes, two at the top and bottom
% extreme H30 postions, and one based on my directly measured H30 hip position

	
	figure(1); clf; hold on; 
    	drawEllipse([Ecenx(1,100) Ecenz(1,100) 99.45 43 6.4]); % H30=440  Top extreme ellipse postion
    	xlim([0 1500]);
      ylim([0 2000]);
      axis equal;
      
      drawEllipse([Ecenx(1,1) Ecenz(1,1) 99.45 43 6.4]) % H30=340 Bottome extreme ellipes postion
      
      drawEllipse([Ecenx(1,51) Ecenz(1,51) 99.45 43 6.4]); % H30=390 Mikels H30 point eyellipes
      
     % drawEllipse([Ecenx_2(1,100) Ecenz_2(1,100) 99.45 43 6.4]);
      
     %drawEllipse([Ecenx_2(1,51) Ecenz_2(1,51) 99.45 43 6.4]);
      
     % drawEllipse([Ecenx_2(1,1) Ecenz_2(1,1) 99.45 43 6.4]);
       
       
%plot(X,H30,X95,H30); 
plot(Xg,H30,X95g,H30,";95th percentile selected seat postion curve (SgRP);");

xlabel("X value mm");

ylabel("Z value mm");

title("Class A vehicle 95th Percentile selected seat and Eyellipse positions for the Tango");
