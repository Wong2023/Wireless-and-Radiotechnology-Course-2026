clc;
clear;
close all;

% Parameters
B = 1e6;        % Bandwidth (1 MHz)
R = 100;        % Resistance (100 ohms)
T = 300;        % Temperature (300 K)
k = 1.38e-23;   % Boltzmann constant

% Generate Thermal Noise
n_samples = 10000;
time = 0 : 1/B : (n_samples-1)/B;

thermal_noise = sqrt(4 * k * T * R * B) * randn(1, n_samples);

% Plot Time Domain
figure;
plot(time, thermal_noise);
title('Thermal Noise (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

% Power Spectral Density
% Power Spectral Density using FFT (no toolbox required)

N = length(thermal_noise);
Y = fft(thermal_noise);
PSD = (1/(B*N)) * abs(Y).^2;
freq = (0:N-1)*(B/N);

figure;
plot(freq(1:N/2), 10*log10(PSD(1:N/2)));
title('Power Spectral Density of Thermal Noise');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');

