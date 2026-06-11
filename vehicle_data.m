function vehicle = vehicle_data(choice)

switch choice

    case 1

        vehicle.name = 'Formula One';
        vehicle.mass = 798;
        vehicle.wheelbase = 3.60;
        vehicle.cg = 0.30;
        vehicle.mu = 1.80;
        vehicle.Area = 1.50;
        vehicle.Power = 750;
        vehicle.rearAeroBias = 0.60;

    case 2

        vehicle.name = 'Formula Student';
        vehicle.mass = 250;
        vehicle.wheelbase = 1.60;
        vehicle.cg = 0.28;
        vehicle.mu = 1.50;
        vehicle.Area = 1.20;
        vehicle.Power = 80;
        vehicle.rearAeroBias = 0.55;

    case 3

        vehicle.name = 'Hatchback';
        vehicle.mass = 1200;
        vehicle.wheelbase = 2.50;
        vehicle.cg = 0.55;
        vehicle.mu = 1.00;
        vehicle.Area = 2.20;
        vehicle.Power = 100;
        vehicle.rearAeroBias = 0.50;

    case 4

        vehicle.name = 'SUV';
        vehicle.mass = 1800;
        vehicle.wheelbase = 2.80;
        vehicle.cg = 0.75;
        vehicle.mu = 0.95;
        vehicle.Area = 2.80;
        vehicle.Power = 150;
        vehicle.rearAeroBias = 0.45;

    case 5

        vehicle.name = input('Vehicle Name: ','s');

        vehicle.mass = input('Mass (kg): ');
        vehicle.wheelbase = input('Wheelbase (m): ');
        vehicle.rearAeroBias = ...
            input('Rear Aero Load Fraction (0-1): ');
        vehicle.cg = input('CG Height (m): ');
        vehicle.mu = input('Tyre Friction Coefficient: ');
        vehicle.Area = input('Frontal Area (m^2): ');
        vehicle.Power = input('Power (kW): ');

    otherwise

        error('Invalid Selection')

end

end
