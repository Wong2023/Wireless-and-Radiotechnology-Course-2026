%% communication_assignment.m
% Assignment: WiFi vs Bluetooth vs Cellular performance vs distance
% Metrics: Received power (dB), SINR (dB), Channel capacity (shown in dB as 10*log10(C))
% Model: Friis free-space transmission

clear; close all; clc;

%% Common parameters
G_t = 1;              % Tx antenna gain (linear)
G_r = 1;              % Rx antenna gain (linear)
c   = 3e8;            % speed of light (m/s)
Pn  = 500e-6;         % noise power (W)  (given)

% Helper functions
to_dB = @(x) 10*log10(x);     % power-like quantity to dB
to_dBm = @(x) 10*log10(x/1e-3);

% Friis: Pr = Pt * Gt * Gr * (lambda / (4*pi*d))^2
friis_Pr = @(Pt, lambda, d) Pt .* G_t .* G_r .* (lambda ./ (4*pi.*d)).^2;

%% -------------------- Task 1: WiFi --------------------
f_wifi   = 2.4e9;        % Hz (IEEE 802.11b)
BW_wifi  = 22e6;         % Hz
d_wifi   = 1:5:100;      % m
P_t_wifi = 100e-3;       % W
lambda_wifi = c / f_wifi;

Pr_wifi   = friis_Pr(P_t_wifi, lambda_wifi, d_wifi);  % W
SINR_wifi = Pr_wifi ./ Pn;                            % linear
C_wifi    = BW_wifi .* log2(1 + SINR_wifi);           % bit/s

%% -------------------- Task 2: Bluetooth --------------------
f_bt   = 2.45e9;         % Hz
BW_bt  = 2e6;            % Hz
d_bt   = 0.5:0.5:10;     % m
P_t_bt = 10e-3;          % W
lambda_bt = c / f_bt;

Pr_bt   = friis_Pr(P_t_bt, lambda_bt, d_bt);          % W
SINR_bt = Pr_bt ./ Pn;                                % linear
C_bt    = BW_bt .* log2(1 + SINR_bt);                 % bit/s

%% -------------------- Task 3: Cellular --------------------
f_cell   = 850e6;        % Hz (2G GSM example)
BW_cell  = 200e3;        % Hz
d_cell   = 100:100:5000; % m
P_t_cell = 40;           % W (given)
lambda_cell = c / f_cell;

Pr_cell   = friis_Pr(P_t_cell, lambda_cell, d_cell);  % W
SINR_cell = Pr_cell ./ Pn;                             % linear
C_cell    = BW_cell .* log2(1 + SINR_cell);            % bit/s

%% Convert to dB for plotting
Pr_wifi_dB   = to_dB(Pr_wifi);
Pr_bt_dB     = to_dB(Pr_bt);
Pr_cell_dB   = to_dB(Pr_cell);

SINR_wifi_dB = to_dB(SINR_wifi);
SINR_bt_dB   = to_dB(SINR_bt);
SINR_cell_dB = to_dB(SINR_cell);

% "Capacity in dB" (as in the example figure): 10*log10(C)
% Note: Capacity is normally shown in bit/s or Mbps, but assignment asks dB-like plot.
C_wifi_dB = to_dB(C_wifi);
C_bt_dB   = to_dB(C_bt);
C_cell_dB = to_dB(C_cell);

%% -------------------- Task 4: Plots (3x3 like the example) --------------------
figure('Name','Wireless Performance vs Distance','Color','w');

% Row 1: Received power
subplot(3,3,1);
plot(d_wifi, Pr_wifi_dB, 'LineWidth', 1.5); grid on;
title('WiFi'); ylabel('P_r (dB)'); xlabel('distance (m)');

subplot(3,3,2);
plot(d_bt, Pr_bt_dB, 'LineWidth', 1.5); grid on;
title('Bluetooth'); ylabel('P_r (dB)'); xlabel('distance (m)');

subplot(3,3,3);
plot(d_cell, Pr_cell_dB, 'LineWidth', 1.5); grid on;
title('Cellular'); ylabel('P_r (dB)'); xlabel('distance (m)');

% Row 2: SINR
subplot(3,3,4);
plot(d_wifi, SINR_wifi_dB, 'LineWidth', 1.5); grid on;
ylabel('SINR (dB)'); xlabel('distance (m)');

subplot(3,3,5);
plot(d_bt, SINR_bt_dB, 'LineWidth', 1.5); grid on;
ylabel('SINR (dB)'); xlabel('distance (m)');

subplot(3,3,6);
plot(d_cell, SINR_cell_dB, 'LineWidth', 1.5); grid on;
ylabel('SINR (dB)'); xlabel('distance (m)');

% Row 3: Capacity (dB)
subplot(3,3,7);
plot(d_wifi, C_wifi_dB, 'LineWidth', 1.5); grid on;
ylabel('Capacity (dB)'); xlabel('distance (m)');

subplot(3,3,8);
plot(d_bt, C_bt_dB, 'LineWidth', 1.5); grid on;
ylabel('Capacity (dB)'); xlabel('distance (m)');

subplot(3,3,9);
plot(d_cell, C_cell_dB, 'LineWidth', 1.5); grid on;
ylabel('Capacity (dB)'); xlabel('distance (m)');

%% -------------------- Comparative plots (same axis idea) --------------------
% Because distance ranges differ a lot, comparison is clearer in separate figures.

figure('Name','Comparative SINR (dB) vs Distance','Color','w');
plot(d_wifi, SINR_wifi_dB, 'LineWidth', 1.5); hold on;
plot(d_bt, SINR_bt_dB, 'LineWidth', 1.5);
plot(d_cell, SINR_cell_dB, 'LineWidth', 1.5);
grid on; xlabel('distance (m)'); ylabel('SINR (dB)');
title('SINR comparison (different distance scales)');
legend('WiFi','Bluetooth','Cellular','Location','best');

figure('Name','Comparative Capacity (Mbps) vs Distance','Color','w');
% Here show capacity in Mbps (more intuitive for report), in addition to the dB plot above
plot(d_wifi, C_wifi/1e6, 'LineWidth', 1.5); hold on;
plot(d_bt, C_bt/1e6, 'LineWidth', 1.5);
plot(d_cell, C_cell/1e6, 'LineWidth', 1.5);
grid on; xlabel('distance (m)'); ylabel('Capacity (Mbps)');
title('Capacity comparison (Mbps)');
legend('WiFi','Bluetooth','Cellular','Location','best');

%%  Brief report 
% Observations (typical trends with Friis free-space model):
% 1) Received power drops ~ 1/d^2, so in dB it decreases roughly linearly with log(distance).
% 2) SINR follows received power since noise is constant -> SINR decreases with distance.
% 3) Capacity decreases with distance because log2(1+SINR) decreases.
% Notes:
% - Cellular uses much longer distances and (here) very high transmit power, so it can remain usable farther.
% - WiFi/Bluetooth operate at similar frequencies, but WiFi has higher Tx power and much larger BW.
%   Larger BW can increase capacity when SINR is decent, but at low SINR capacity still collapses.