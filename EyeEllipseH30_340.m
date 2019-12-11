% H30=340 Bottom most exteme SgRP point 95th Percentile Eyellipes Calculations
% and Plot Code. Proof of Complience for ADR 18/02 clause 18.3.1 for Side View
% in Tango Global Carteesian Coordinate system. 

% z2=24.6966in or 627.29 mm from z=0 to bottome of instramentation
% z1= 27.9in or 708.66 mm from z=0 to top of instramentation
% x2=13.49in or 342.646 mm from x=0 to bottom of instramentation
% x1=12.72  323.088 mm from x=0 top of instramentaion

zi=[708.66,627.29];
xi=[323.088,342.646];

I=polyfit(xi,zi,1);
i=linspace(342.646 ,323.088,100);
Ii=-4.1604.*i+2052;



theta=deg2rad(6.4); % Specifies the Tilt angle of th Eyellipes from the horizontal

alpha=linspace(0,2*pi,1000);

Rx=99.45; % Major Radius/axis ;
Rz=43; % minor Radius/axis;

Cx=1009.7 ;% X center of Ellipse;
Cz=966.62; % Z center of Ellipse ;

x=Rx.*cos(alpha).*cos(theta)-Rz.*sin(alpha).*sin(theta)+Cx;

z=Rx.*cos(alpha).*sin(theta)+Rz.*sin(alpha).*cos(theta)+Cz;

% The maximum x value correspondes to the back end point of the ellipse, this is 
% important to know for mathamatical purposes. to find the max x value type in the
% code max(max(x)) into the command window after running the program. for this 
% ellipse the max x value is 1108.6 the lowest z value is found the same way, 
% with min(min(z)), this is also important.
% the min value is 922.48 
hold on;


c=linspace(0,980,100);

z1=0.12213.*c+801.68140;% using the bottom most point x and z value, and the point
% Defined in the ADR 11 meters ahead of the vehicle at ground level from the 
% rear most point of the ellipse, I used the two known points to calculate the 
% equation for the line tangent to the bottom the ellipse using point slope form.
% However, it is easyer to just use polyfit, just look at the code below.


cx=[-9891.4,988.98];% these are simply the x values of the known points the line
% Tangent to the ellipes passes through

% similarly these values are the z values of the known points
% the line Tangent ot the ellipes passes through. 
cy=[-406.4,922.47];

Yt=polyfit(cx,cy,1);% This uses least squares regression to n=1 to fit a 
% linear equation through the two respective points. Input said equation into v
% Thankyou for your time. 

vx=[910.87,0];
vz=[955.5344,-345.3256];

vh=polyfit(vx,vz,1); 

v=1.4282.*c-345.3256;

axis equal; 

grid on;

plot(i,Ii,"color",'r','lineWidth',5,";Group 1 Intrumentation;");
plot(c,z1,"color",'b',"linestyle","--",";Boundary of Non-complience;",c,v,"color",'b',"linestyle","--");
plot(x,z,'lineWidth',2,'color','k');
xlim([0 2000]);
ylim([0 2000]);
title(" H30=340mm Bottom most extreme 95th Percentile Eyellipse and field of view Boundaries Side View.");
xlabel("X mm");
ylabel("Z mm");
text(1150,975, ['\leftarrow 95th Percentile Eyellipse']);
saveas(1,"EyellipsePlotH30=340","jpg");


