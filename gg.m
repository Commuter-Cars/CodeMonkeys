% some comparisons 

clear all;

V=linspace(0,100,100);

Xl=.30.*V.*sqrt(6.5./.65);
%Xr=.45.*V.*sqrt(6.5./.65);
dx=V.*sqrt((2.*3.25)/(.85.*.8.*32.17));
mph=(60/88).*V;
%y=[47,50,60];
%x=[30,35,40];
%polyfit(x,y,1)
y=1.3.*mph+6.833;
X=1.15.*mph+11.1;


hold on;
grid on;
plot(mph,dx,";Fricke Critical turn;");
plot(mph,X,";Wade turnaway equation(wheels to clear obs);",mph,Xl,";Limpert min turnaway dist(wheels to clear obs) C=0.3;");
plot(mph,y,";Least Squars regression Shuman data (wheels to clear obs);");
plot(mph,r,";(Total swerve manuever) least squars regression Shauman Data;",mph,Xr,";limpert (Total Swerve);");
xlabel("mi/h");
ylabel("Longitudinal Distance traveled during emergency lane change Manuever ft");