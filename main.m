clear;
clc;
close all;

disp('====================================');
disp('VEHICLE DYNAMICS SIMULATOR');
disp('====================================');

disp('1. F1');
disp('2. Formula Student');
disp('3. Hatchback');
disp('4. SUV');
disp('5. Custom Vehicle');

choice = input('Select vehicle: ');

vehicle = vehicle_data(choice);

%% Vehicle Summary

fprintf('\n');
fprintf('Selected Vehicle: %s\n',vehicle.name);
fprintf('Mass: %.1f kg\n',vehicle.mass);
fprintf('Wheelbase: %.2f m\n',vehicle.wheelbase);
fprintf('CG Height: %.2f m\n',vehicle.cg);
fprintf('Power: %.1f kW\n',vehicle.Power);
fprintf('Frontal Area: %.2f m^2\n',vehicle.Area);

%% Weight Transfer Analysis

acc = -8:0.1:8;

n = length(acc);

deltaW = zeros(1,n);

for i = 1:n

    [deltaW(i),~,~] = ...
        weight_transfer( ...
        vehicle.mass,...
        vehicle.wheelbase,...
        vehicle.cg,...
        acc(i));

end

%% Graph 1

figure

plot(acc,deltaW,'LineWidth',2)

grid on

xlabel('Acceleration (m/s^2)')
ylabel('Weight Transfer (N)')

title(['Weight Transfer Analysis - ' vehicle.name])

%% CG Height Sensitivity

h = 0.2:0.01:1.0;

deltaW_cg = ...
(vehicle.mass*5*h)./vehicle.wheelbase;

figure

plot(h,deltaW_cg,'LineWidth',2)

grid on

xlabel('CG Height (m)')
ylabel('Weight Transfer (N)')

title('CG Height Sensitivity')

%% Wheelbase Sensitivity

L = 1.5:0.05:4;

deltaW_wb = ...
(vehicle.mass*5*vehicle.cg)./L;

figure

plot(L,deltaW_wb,'LineWidth',2)

grid on

xlabel('Wheelbase (m)')
ylabel('Weight Transfer (N)')

title('Wheelbase Sensitivity')

%% Traction Analysis

traction_analysis(vehicle)

%% Vehicle Comparison

vehicleNames = {'F1','Formula Student','Hatchback','SUV'};

weightTransferValues = zeros(1,4);

for i = 1:4

    temp = vehicle_data(i);

    weightTransferValues(i) = ...
        (temp.mass*5*temp.cg)/temp.wheelbase;

end

figure

bar(weightTransferValues)

set(gca,'XTickLabel',vehicleNames)

ylabel('Weight Transfer (N)')
title('Vehicle Comparison at 5 m/s^2')

grid on

%% Aerodynamic Module

disp(' ');
disp('====================================');
disp('AERODYNAMIC ANALYSIS');
disp('====================================');
disp(' ');

aero_analysis(vehicle);

disp(' ');
disp('Simulation Complete.');