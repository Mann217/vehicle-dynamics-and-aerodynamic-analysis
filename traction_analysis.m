function traction_analysis(vehicle)

g = 9.81;

staticRear = ...
    (vehicle.mass*g)/2;

rearLoad = ...
    staticRear + ...
    (vehicle.mass*5*vehicle.cg)/vehicle.wheelbase;

Fmax = vehicle.mu*rearLoad;

amax = Fmax/vehicle.mass;

fprintf('\n')

fprintf('TRACTION ANALYSIS\n')


fprintf('Vehicle : %s\n',vehicle.name)
fprintf('Maximum Traction Force : %.2f N\n',Fmax)
fprintf('Maximum Acceleration : %.2f m/s^2\n',amax)

zeroToHundred = 27.78/amax;

fprintf('Estimated 0-100 km/h Time : %.2f s\n', ...
    zeroToHundred)

end