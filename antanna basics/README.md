Beam Solid Angle Calculation (MATLAB)
📌 Description

This project calculates the beam solid angle (beam area) of an antenna using numerical integration in spherical coordinates.

The beam area is computed using:

Ω
𝐴
=
∬
𝑃
𝑛
(
𝜃
,
𝜙
)
sin
⁡
(
𝜃
)
 
𝑑
𝜃
 
𝑑
𝜙
Ω
A
	​

=∬P
n
	​

(θ,ϕ)sin(θ)dθdϕ

For the test case:

θ from 0° to 90°

φ from 0° to 360°

Field pattern: E(θ,φ) = cos(θ)

Power pattern: P(θ,φ) = cos²(θ)

Expected result:

Ω
𝐴
≈
2.10
 steradians
Ω
A
	​

≈2.10 steradians
📂 Files
1️⃣ beam_area_input.m

This version asks the user to:

Enter theta limits

Enter phi limits

Enter the field expression manually (example: cos(THETA))

Enter the power expression manually (example: cos(THETA).^2)

The program:

Converts degrees to radians

Creates a spherical grid using meshgrid

Calculates normalized power pattern

Computes beam area using numerical summation

Prints the beam area in steradians

This version is interactive and flexible.

2️⃣ beam_area_fixed.m

This version:

Asks only for theta and phi limits

Automatically uses:

E = cos(THETA)

P = cos(THETA).^2

It directly computes the beam area without requiring manual formula input.

This version is simpler and easier to run.
