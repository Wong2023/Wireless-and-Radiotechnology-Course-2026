clc;
close all;
clear all;

tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree=');

pmin = input('The lower bound of phi in degree=');
pmax = input('The upper bound of phi in degree=');

tinc = 2;
pinc = 4;
rad  = pi/180;

theta1 = (tmin:tinc:tmax);
phi1   = (pmin:pinc:pmax);

theta = theta1 .* rad;
phi   = phi1 .* rad;

[THETA, PHI] = meshgrid(theta, phi);

y1 = input('The field pattern: E(THETA,PHI)=');
v  = input('The field pattern: P(THETA,PHI)=','s');

y = abs(y1);

% optional normalization (если нужно)
ratio = max(y(:));
if ratio ~= 0
    y = y ./ ratio;
end

[X, Yc, Z] = sph2cart(THETA, PHI, y);

mesh(X, Yc, Z);
title('3 D Pattern','Color','b','FontName','Helvetica','FontSize',12,'FontWeight','demi');
xlabel('X'); ylabel('Y'); zlabel('Z');
axis equal;

fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta =%2.0f', tmin);
fprintf(' : %2.0f', tinc);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi =%2.0f', pmin);
fprintf(' : %2.0f', pinc);
fprintf(' : %2.0f', pmax);
fprintf('\n FIELD PATTERN : %s', v);
fprintf('\n \n Output is shown in the figure below----------- ');
fprintf('\n');
