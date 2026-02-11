clc; clear; close all;

%% Parameters
fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/fs:1;              % Time vector (1 second)
f_c = 50;                  % Carrier frequency (Hz)
SNR_list = [10 5 0 -5];    % SNR values (dB)

%% Generate binary message (0/1)
message_signal = randi([0 1], 1, length(t));

%% ASK Modulation (OOK: 1 -> carrier, 0 -> 0)
carrier = cos(2*pi*f_c*t);
modulated = message_signal .* carrier;

%% Helper: Add noise for a given SNR (no toolbox)
add_noise_snr = @(x, snr_db) x + sqrt( mean(x.^2) / (10^(snr_db/10)) ) * randn(size(x));

%% Demodulation settings
lp_cutoff = 10; % Hz (keep small because message is slow due to fs=1000 and random bits each sample)
% NOTE: message is random every sample -> very high "bit rate".
% We'll smooth heavily to get a decision statistic.

% FFT-based low-pass filter (no toolbox)
fft_lowpass = @(x, cutoff, fs) ...
    real(ifft( fft(x) .* ( ((0:length(x)-1)*(fs/length(x)) <= cutoff) | ((0:length(x)-1)*(fs/length(x)) >= fs-cutoff) ) ));

%% Plot
figure('Name','ASK with different SNR','NumberTitle','off');

for i = 1:length(SNR_list)
    snr_db = SNR_list(i);

    % Add noise
    received = add_noise_snr(modulated, snr_db);

    % Coherent demodulation: multiply by carrier (mix down)
    mixed = received .* carrier;

    % Low-pass filter to remove 2*fc component + noise
    baseband = fft_lowpass(mixed, lp_cutoff, fs);

    % Decision (threshold at half of max)
    thresh = 0.5 * max(baseband);
    demod_bits = baseband > thresh;

    % --- Plot small time window to see clearly
    idx = 1:300; % first 0.3 sec

    subplot(length(SNR_list), 3, (i-1)*3 + 1);
    plot(t(idx), modulated(idx));
    title(['Modulated (ASK)']);
    xlabel('Time (s)'); ylabel('Amp');

    subplot(length(SNR_list), 3, (i-1)*3 + 2);
    plot(t(idx), received(idx));
    title(['Received, SNR = ' num2str(snr_db) ' dB']);
    xlabel('Time (s)'); ylabel('Amp');

    subplot(length(SNR_list), 3, (i-1)*3 + 3);
    stairs(t(idx), message_signal(idx), 'LineWidth', 1); hold on;
    stairs(t(idx), demod_bits(idx), 'LineWidth', 1);
    hold off;
    ylim([-0.2 1.2]);
    title('Original bits vs Demodulated');
    xlabel('Time (s)'); ylabel('Bit');
    legend('Original','Demod','Location','best');
end
