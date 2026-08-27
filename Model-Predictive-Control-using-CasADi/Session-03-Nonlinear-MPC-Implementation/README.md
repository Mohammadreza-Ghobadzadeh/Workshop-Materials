# Session 3 — MPC Formulation & Hands-on Nonlinear MPC Implementation

[Watch Session 3 on YouTube](https://youtu.be/Bi6IlE7btto?list=PLUtae4hCv9Go)

## Overview

Session 3 formulates and implements a nonlinear Model Predictive Controller in MATLAB/CasADi for point stabilization of a mobile robot.

## Code Files

- `MPC_sing_shooting.m` — Single Shooting nonlinear MPC
- `MPC_mul_shooting.m` — Multiple Shooting nonlinear MPC
- `shift.m` — apply first control and shift the horizon
- `Draw_MPC_point_stabilization_v1.m` — closed-loop visualization

## Running the Examples

```matlab
MPC_sing_shooting
% or
MPC_mul_shooting
```

Keep `shift.m` and `Draw_MPC_point_stabilization_v1.m` in the same folder.

**Tools:** MATLAB, CasADi, IPOPT
**Lecturers:** Hamzeh Kashi Yarandi & MohammadReza Ghobadzadeh
