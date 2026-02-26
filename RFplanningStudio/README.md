Experiment 1 – Increase Gateway Height (+5 m)

Does maximum LOS distance change?
Yes. The radio horizon increases because LOS distance depends on antenna height.

Does link feasibility improve significantly?
Not in this model. The received power curve does not change.

Why?
The path loss model does not include antenna height. Height mainly affects geometry and Fresnel clearance, not the log-distance attenuation model used here.

Experiment 2 – Increase Antenna Gain to 5 dBi

How does the received power curve change?
The curve shifts upward by about +6 dB.

How much additional range is achieved?
The maximum communication distance increases significantly (roughly 60–70% more range in this setup).

Why does antenna gain extend coverage?
Higher antenna gain increases EIRP and received signal strength, improving the link budget and allowing the signal to stay above sensitivity at longer distances.

Experiment 3 – Change Environment Exponent (n)

How does increasing n affect coverage?
Increasing n makes the path loss grow faster with distance, which sharply reduces coverage range.

Which has stronger impact on range: gain increase or environment change?
The environment exponent has a stronger impact.

Explain physically.
A higher n represents more obstacles, reflections, and attenuation. It increases the slope of signal decay, causing much faster signal weakening over distance.

Experiment 4 – Move Gateway Location (Fresnel Study)

Where is the Fresnel radius largest?
At the midpoint of the link (0.5D).

Why is midpoint usually critical?
Because the Fresnel radius is proportional to √(x(D−x)), which is maximum at the center of the link.

What happens if the 60% clearance rule is violated?
Diffraction losses increase, signal strength decreases, and the link may become unstable or fail.

Final Conclusion (5–6 lines)

In practical wireless deployment, the environment has the strongest impact on coverage. While antenna gain improves the link budget by adding fixed dB, the path loss exponent determines how fast the signal decays with distance. A higher exponent dramatically reduces range. Antenna height improves geometry and clearance but does not change the attenuation slope in this model. Therefore, proper site selection and environmental conditions are the most critical factors for reliable coverage.
