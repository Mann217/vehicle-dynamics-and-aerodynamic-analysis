function [deltaW,frontLoad,rearLoad] = ...
    weight_transfer(mass,wheelbase,cg,acc)

g = 9.81;

deltaW = ...
    (mass*acc*cg)/wheelbase;

staticLoad = ...
    (mass*g)/2;

frontLoad = ...
    staticLoad - deltaW;

rearLoad = ...
    staticLoad + deltaW;

end
