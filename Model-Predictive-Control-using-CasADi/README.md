# Model Predictive Control using CasADi

### Persian-Language Workshop on Model Predictive Control with MATLAB and CasADi

Developed and delivered through the **Process Control Laboratory**, K. N. Toosi University of Technology.

**Lecturers:** MohammadReza Ghobadzadeh & Hamzeh Kashi Yarandi
**Language:** Persian
**Primary tools:** MATLAB, CasADi, IPOPT

## About the Workshop

This workshop connects the mathematical foundations of optimal control and nonlinear programming with the practical implementation of receding-horizon control using MATLAB and CasADi.

The workshop begins with an overview of Model Predictive Control (MPC) and its application landscape, develops the CasADi concepts required for numerical implementation, and concludes with a hands-on nonlinear MPC implementation for point stabilization of a mobile robot.

To avoid unnecessary duplication, foundational material that overlaps with the **Numerical Optimal Control Workshop** is linked as a shared prerequisite rather than copied into this repository.

## Recorded Lectures

| Session | Topic | Video |
| --- | --- | --- |
| 01 | Workshop Overview & MPC Landscape | [Watch on YouTube](https://youtu.be/2KobQZY-uXQ?list=PLUtae4hCv9Go) |
| 02 | CasADi Foundations & Algorithmic Differentiation | [Watch on YouTube](https://youtu.be/zn07UJtmqCQ?list=PLUtae4hCv9Go) |
| — | Shared Prerequisites from the Numerical Optimal Control Workshop | [See prerequisite path](Shared-Prerequisites/) |
| 03 | MPC Formulation & Hands-on Nonlinear MPC Implementation | [Watch on YouTube](https://youtu.be/Bi6IlE7btto?list=PLUtae4hCv9Go) |

**Full MPC playlist:** [Model Predictive Control using CasADi](https://www.youtube.com/playlist?list=PLUtae4hCv9Go)

## Recommended Learning Path

1. **Session 1 — Workshop Overview & MPC Landscape**
2. **Session 2 — CasADi Foundations & Algorithmic Differentiation**
3. Complete the [Shared Prerequisites](Shared-Prerequisites/) from the Numerical Optimal Control Workshop:
   - CasADi symbolics, function objects, root finding, and ODE/DAE tools
   - Numerical optimization and nonlinear programming
   - Direct Single Shooting
   - Direct Multiple Shooting
4. **Session 3 — MPC Formulation & Hands-on Implementation**

## Software Requirements

- MATLAB
- CasADi for MATLAB
- IPOPT through CasADi

Make sure CasADi is installed and available on your MATLAB path before running the examples.

```matlab
addpath('C:\\path\\to\\casadi')
import casadi.*
```

## Hands-on MPC Codes

The main implementation codes are provided in [Session 03](Session-03-Nonlinear-MPC-Implementation/):

- `MPC_sing_shooting.m` — nonlinear MPC using a Single Shooting formulation
- `MPC_mul_shooting.m` — nonlinear MPC using a Multiple Shooting formulation
- `shift.m` — applies the first control move and shifts the control sequence for the next MPC iteration
- `Draw_MPC_point_stabilization_v1.m` — visualization of the closed-loop trajectory, predictions, and control inputs

## Related Workshop

**Numerical Optimal Control Workshop**
https://github.com/Hamzehkashi/Numerical-Optimal-Control-Workshop

See [Shared Prerequisites](Shared-Prerequisites/) and [ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md).
