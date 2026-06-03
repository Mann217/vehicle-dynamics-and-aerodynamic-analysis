function aero_analysis(vehicle)

rho = 1.225;
g = 9.81;

Cd = input('Drag Coefficient Cd: ');
Cl = input('Downforce Coefficient Cl: ');

A = vehicle.Area;
Power = vehicle.Power * 1000;

v = 0:1:400;
v_ms = v ./ 3.6;

%% Aerodynamics

Drag = 0.5 .* rho .* Cd .* A .* (v_ms.^2);

Downforce = 0.5 .* rho .* Cl .* A .* (v_ms.^2);

PowerRequired = Drag .* v_ms;

%% Top Speed

index = find(PowerRequired >= Power,1);

if isempty(index)

    topSpeed = NaN;
    fprintf('\nTop speed exceeds search range.\n');

else

    topSpeed = v(index);

    fprintf('\n');
    fprintf('Estimated Top Speed = %.1f km/h\n', ...
        topSpeed);

end

%% Nonlinear Axle Loads

beta = vehicle.rearAeroBias;

acc = 5;

deltaW = ...
(vehicle.mass * acc * vehicle.cg) ...
/ vehicle.wheelbase;

frontStatic = ...
0.5 * vehicle.mass * g;

rearStatic = ...
0.5 * vehicle.mass * g;

frontLoad = ...
frontStatic ...
- deltaW ...
+ (1-beta).*Downforce;

rearLoad = ...
rearStatic ...
+ deltaW ...
+ beta.*Downforce;

%% Drag

figure

plot(v,Drag,'LineWidth',2)

grid on

xlabel('Speed (km/h)')
ylabel('Drag Force (N)')

title('Aerodynamic Drag vs Speed')

%% Downforce

figure

plot(v,Downforce,'LineWidth',2)

grid on

xlabel('Speed (km/h)')
ylabel('Downforce (N)')

title('Downforce vs Speed')

%% Power

figure

plot(v,PowerRequired/1000,'LineWidth',2)

hold on

plot(v,...
Power*ones(size(v))/1000,...
'LineWidth',2)

grid on

xlabel('Speed (km/h)')
ylabel('Power (kW)')

title('Power Required vs Available Power')

legend('Required','Available')

%% Axle Loads

figure

plot(v,frontLoad,'LineWidth',2)

hold on

plot(v,rearLoad,'LineWidth',2)

grid on

xlabel('Speed (km/h)')
ylabel('Axle Load (N)')

title('Axle Load Variation with Speed')

legend('Front Axle','Rear Axle')

%% Downforce Distribution

figure

plot(v,...
(1-beta).*Downforce,...
'LineWidth',2)

hold on

plot(v,...
beta.*Downforce,...
'LineWidth',2)

grid on

xlabel('Speed (km/h)')
ylabel('Downforce Contribution (N)')

title('Front vs Rear Aerodynamic Loading')

legend('Front','Rear')

end