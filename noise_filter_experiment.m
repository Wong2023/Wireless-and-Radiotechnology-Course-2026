clc;
clear;
close all;

%% Parameters
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector
f_signal = 5;           % Signal frequency (Hz)
amplitude = 1;          % Signal amplitude
noise_level = 0.5;      % Noise strength
cutoff_frequency = 10;  % Low-pass cutoff (Hz)

%% Generate Original Signal
original_signal = amplitude * sin(2*pi*f_signal*t);

%% Add Gaussian White Noise
noise = noise_level * randn(size(t));
noisy_signal = original_signal + noise;

%% Plot Original and Noisy Signals
figure;
subplot(3,1,1);
plot(t, original_signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisy_signal);
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Low-pass filter using FFT (no toolbox)

N = length(noisy_signal);
Y = fft(noisy_signal);
freq = (0:N-1)*(fs/N);

% Create low-pass mask
mask = freq <= cutoff_frequency | freq >= fs-cutoff_frequency;
Y_filtered = Y .* mask;

filtered_signal = real(ifft(Y_filtered));


%% Plot Filtered Signal
subplot(3,1,3);
plot(t, filtered_signal);
title('Filtered Signal (Low-pass)');
xlabel('Time (s)');
ylabel('Amplitude');
