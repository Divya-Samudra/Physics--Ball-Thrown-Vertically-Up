clc; clear all;

%Ball thrown vertical up with a initial velocity
%---------------------
% inputs
height = input('Input height from where object is thrown in m: ');
u = input('Input initial velocity of the object in m/s: ');

%system data
t = 0:0.03:25; %time of simulation
g = -9.8; %gravitational force

%Calculations
vel = u + g*t; %velocity v=u+at
y = height + (u*t + 0.5*g*t.^2); %vertical displacement S=ut+0.5at^2

%----------Plotting the graph-------------------------

%to avoid ball going below horizontal reference
ground_cross = find(y<=0);
if height~=0
    ground = ground_cross(1);
else
    ground = ground_cross(2);
end
yaxis_max = max(max(vel),max(y));

figure(1)
set(gcf,'Name','Velocity and Displacement','Color','w')
plot(t(1:ground),vel(1:ground),'bo','LineWidth',2)
hold on;
plot(t(1:ground),y(1:ground),'r*','LineWidth',2)
hold on;

xlabel('Time (s)')
ylabel('Velocity(m/s) , Displacement(m)')
axis([0 t(ground) vel(ground) yaxis_max+5]) %to see the entire animation in still axis
title('Ball thrown vertically up')

plot(t(1:ground),0)
hold on;
plot(t(1:ground),0)
hold on;
plot(t(1:ground),0)
hold on;
plot(t(1:ground),0)
hold on;
txt1 = sprintf('Initial height = %.2fm',height);
txt2 = sprintf('Initial velocity = %.2fm/s',u);
txt3 = sprintf('Time taken = %.2fs',t(ground));
txt4 = sprintf('Final velocity = %.2fm/s',vel(ground));
legend('Velocity','Displacement',txt1,txt2,txt3,txt4);