# Numerical Optimal Control Workshop

**Persian-language workshop on numerical optimal control with hands-on MATLAB and CasADi implementations**

Developed and delivered through the **Advanced Control Systems Laboratory (ACSL)**, School of Electrical and Computer Engineering, University of Tehran.

**Lecturers:** Hamzeh Kashi Yarandi & MohammadReza Ghobadzadeh  
**Language:** Persian  
**Primary tools:** MATLAB, CasADi, IPOPT, CVODES, IDAS, and BONMIN

**Recorded lectures:** [Control Research Team — YouTube Playlists](https://www.youtube.com/@Control_Research_Team/playlists)  
**Companion source-code repository:** [Hamzehkashi/Numerical-Optimal-Control-Workshop](https://github.com/Hamzehkashi/Numerical-Optimal-Control-Workshop)

## About the Workshop

This folder contains the session guides and lecture links for the Numerical Optimal Control Workshop. The workshop bridges the theoretical foundations of optimal control and their practical numerical implementation in MATLAB/CasADi.

## Sessions

| Session | Topic | Recorded lecture |
| --- | --- | --- |
| [01](./Session-01-Foundations-and-CasADi/) | Foundations of Numerical Optimal Control & CasADi | [Watch](https://youtu.be/L3QsqFfRAtQ?list=PLJ5BV5EDkg3s) |
| [02](./Session-02-Numerical-Optimization/) | Numerical Optimization & Direct Shooting Formulations | [Watch](https://youtu.be/F-p0v5NFCwQ?list=PLJ5BV5EDkg3s) |
| [03](./Session-03-Direct-Single-Shooting/) | Direct Single Shooting in Practice | [Watch](https://youtu.be/g_bZyt_Jphc?list=PLJ5BV5EDkg3s) |
| [04](./Session-04-Direct-Multiple-Shooting/) | Direct Multiple Shooting in Practice | [Watch](https://youtu.be/heRA5tGjCqw?list=PLJ5BV5EDkg3s) |
| [05](./Session-05-Indirect-Optimal-Control/) | Indirect Optimal Control Methods | [Watch](https://youtu.be/6Hmo3n-oWsc?list=PLJ5BV5EDkg3s) |
| [06](./Session-06-Indirect-Multiple-Shooting-and-DAE/) | Indirect Multiple Shooting & DAE-Constrained Optimal Control | [Watch](https://youtu.be/LS2HpZe6cGQ?list=PLJ5BV5EDkg3s) |
| [07](./Session-07-Dynamic-Programming-and-LQR/) | Dynamic Programming & LQR | [Watch](https://youtu.be/-G95pVp0-E8?list=PLJ5BV5EDkg3s) |

## Software Requirements

- MATLAB
- [CasADi](https://web.casadi.org/) with MATLAB support
- IPOPT, CVODES, and IDAS (through CasADi)
- BONMIN for Session 2 mixed-integer example, if available
- Control System Toolbox for Session 7 (`dlqr`)

```matlab
addpath('C:\\path\\to\\casadi')
import casadi.*
```

MATLAB implementation files for these sessions are maintained in the companion repository linked above.

## License and Reuse

No repository-wide open-source license is currently applied. Consult the companion repository and original educational sources before redistribution.

---

Advanced Control Systems Laboratory (ACSL)  
School of Electrical and Computer Engineering  
University of Tehran
