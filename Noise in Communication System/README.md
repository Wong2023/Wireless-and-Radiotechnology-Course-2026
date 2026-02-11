📡 Wireless and Radio Technology – MATLAB Experiments
Overview

This repository contains MATLAB simulations related to noise analysis and communication system performance. The experiments focus on:

Thermal Noise Generation and PSD Analysis

Adding and Removing Noise from a Signal

Impact of SNR on ASK Demodulation Performance

These experiments demonstrate fundamental signal processing and communication system concepts.

🔹 Experiment 1 – Thermal Noise Simulation
Objective

To simulate thermal noise generation and analyze its Power Spectral Density (PSD).

Parameters

Bandwidth (B) = 1 MHz

Resistance (R) = 100 Ω

Temperature (T) = 300 K

Description

Thermal noise was generated using the formula:

𝑉
𝑛
=
4
𝑘
𝑇
𝑅
𝐵
V
n
	​

=
4kTRB
	​


where k is Boltzmann’s constant.

The generated noise was:

Plotted in the time domain

Analyzed in the frequency domain using PSD

Since Signal Processing Toolbox was unavailable, PSD was calculated using FFT.

Observations

The noise amplitude fluctuates randomly over time.

The PSD is approximately flat across frequencies.

This confirms that thermal noise behaves as white noise.

Increasing temperature, resistance, or bandwidth increases total noise power.

🔹 Experiment 2 – Noise Addition and Removal
Objective

To simulate adding Gaussian noise to a sinusoidal signal and removing it using a low-pass filter.

Parameters

Sampling frequency (fs) = 1000 Hz

Signal frequency = 5 Hz

Cutoff frequency = 10 Hz

Description

Steps performed:

Generated a sinusoidal signal.

Added Gaussian white noise.

Applied a low-pass filter to remove high-frequency noise.

Plotted original, noisy, and filtered signals.

An FFT-based low-pass filtering method was used.

Observations

Noise significantly distorts the original sinusoidal signal.

The low-pass filter removes high-frequency noise components.

If the cutoff frequency is too low, signal distortion occurs.

There is a trade-off between noise reduction and signal preservation.

🔹 Experiment 3 – SNR Impact on ASK Demodulation
Objective

To investigate how varying Signal-to-Noise Ratio (SNR) affects demodulation performance.

Parameters

Sampling frequency (fs) = 1000 Hz

Carrier frequency (fc) = 50 Hz

SNR values: 10 dB, 5 dB, 0 dB, -5 dB

Description

Steps performed:

Generated a binary message signal.

Applied Amplitude Shift Keying (ASK) modulation.

Added Gaussian white noise for different SNR values.

Demodulated the received signal.

Compared original and recovered signals.

Observations

At high SNR (10 dB), demodulation performance is good.

At medium SNR (5 dB and 0 dB), noticeable errors appear.

At low SNR (-5 dB), demodulation performance significantly degrades.

Lower SNR leads to higher bit detection errors.

This demonstrates the importance of maintaining sufficient SNR in communication systems.

Conclusion

These experiments demonstrate:

The characteristics of thermal noise

The effect of noise on signals

The role of filtering in signal recovery

The impact of SNR on digital communication performance

The simulations provide practical insight into theoretical concepts discussed in wireless and communication systems lectures.
