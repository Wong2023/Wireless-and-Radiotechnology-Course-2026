
%%
clc;
close all;
clear all;

tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree=');

pmin = input('The lower bound of phi in degree=');
pmax = input('The upper bound of phi in degree=');

% Convert degrees to radians
theta = (tmin:tmax) * pi/180;
phi   = (pmin:pmax) * pi/180;

dth = theta(2) - theta(1);
dph = phi(2) - phi(1);

[THETA, PHI] = meshgrid(theta, phi);

% Fixed field and power pattern
x = cos(THETA);
P = x.^2;

% Normalize
Pn = P ./ max(P(:));

% Compute Beam Solid Angle
Prad = sum(sum(Pn .* sin(THETA))) * dth * dph;

fprintf('\n BEAM AREA (steradians) = %3.2f\n', Prad); %[output:582c6150]


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:582c6150]
%   data: {"dataType":"text","outputData":{"text":"\n BEAM AREA (steradians) = 2.10\n","truncated":false}}
%---
