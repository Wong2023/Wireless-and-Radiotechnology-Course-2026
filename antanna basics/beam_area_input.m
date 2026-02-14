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

% Input field pattern
x_str = input('The field pattern : E(THETA,PHI)=','s');
x = eval(x_str);

% Input power pattern
v = input('The power pattern: P(THETA,PHI)=','s');
P = eval(v);

% Normalize power pattern
Pn = P ./ max(P(:));

% Compute Beam Solid Angle
Prad = sum(sum(Pn .* sin(THETA))) * dth * dph;

fprintf('\n Input Parameters: \n-------------------- '); %[output:9cae9ed2]
fprintf('\n Theta =%2.0f', tmin); %[output:44bd025d]
fprintf(' : %2.0f', dth*180/pi); %[output:9d8381e3]
fprintf(' : %2.0f', tmax); %[output:9450e120]
fprintf('\n Phi =%2.0f', pmin); %[output:8de237f9]
fprintf(' : %2.0f', dph*180/pi); %[output:6038580d]
fprintf(' : %2.0f', pmax); %[output:10611366]
fprintf('\n POWER PATTERN : %s', v); %[output:1f3b2b3a]

fprintf('\n \n Output Parameters: \n-------------------- '); %[output:78cacced]
fprintf('\n BEAM AREA (steradians) = %3.2f\n', Prad); %[output:119b979d]


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:9cae9ed2]
%   data: {"dataType":"text","outputData":{"text":"\n Input Parameters: \n-------------------- ","truncated":false}}
%---
%[output:44bd025d]
%   data: {"dataType":"text","outputData":{"text":"\n Theta = 0","truncated":false}}
%---
%[output:9d8381e3]
%   data: {"dataType":"text","outputData":{"text":" :  1","truncated":false}}
%---
%[output:9450e120]
%   data: {"dataType":"text","outputData":{"text":" : 90","truncated":false}}
%---
%[output:8de237f9]
%   data: {"dataType":"text","outputData":{"text":"\n Phi = 0","truncated":false}}
%---
%[output:6038580d]
%   data: {"dataType":"text","outputData":{"text":" :  1","truncated":false}}
%---
%[output:10611366]
%   data: {"dataType":"text","outputData":{"text":" : 360","truncated":false}}
%---
%[output:1f3b2b3a]
%   data: {"dataType":"text","outputData":{"text":"\n POWER PATTERN : cos(THETA).^2","truncated":false}}
%---
%[output:78cacced]
%   data: {"dataType":"text","outputData":{"text":"\n \n Output Parameters: \n-------------------- ","truncated":false}}
%---
%[output:119b979d]
%   data: {"dataType":"text","outputData":{"text":"\n BEAM AREA (steradians) = 2.10\n","truncated":false}}
%---
