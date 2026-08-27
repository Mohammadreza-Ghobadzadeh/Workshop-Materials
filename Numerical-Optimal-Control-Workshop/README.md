# Numerical Optimal Control Workshop

Persian-language workshop with hands-on MATLAB and CasADi implementations.

**Lecturers:** Hamzeh Kashi Yarandi & Mohammadreza Ghobadzadeh  
**Host:** Advanced Control Systems Laboratory (ACSL), University of Tehran  
**Lectures:** [Control Research Team playlists](https://www.youtube.com/@Control_Research_Team/playlists)

All session codes live **in this folder**. Download or clone [Workshop-Materials](https://github.com/Mohammadreza-Ghobadzadeh/Workshop-Materials) and open the session you need.

## Sessions and files

| Session | Topic | Codes in this repo | Lecture |
| --- | --- | --- | --- |
| [01](Session-01-Foundations-and-CasADi/) | CasADi foundations | `Symbolics.m`, `Function_Objects.m` | [Watch](https://youtu.be/L3QsqFfRAtQ?list=PLJ5BV5EDkg3s) |
| [02](Session-02-Numerical-Optimization/) | Numerical optimization | `Example1.m` … `Example6.m` | [Watch](https://youtu.be/F-p0v5NFCwQ?list=PLJ5BV5EDkg3s) |
| [03](Session-03-Direct-Single-Shooting/) | Direct single shooting | `SingleShooting.m` | [Watch](https://youtu.be/g_bZyt_Jphc?list=PLJ5BV5EDkg3s) |
| [04](Session-04-Direct-Multiple-Shooting/) | Direct multiple shooting | `DirectMultipleShooting.m` | [Watch](https://youtu.be/heRA5tGjCqw?list=PLJ5BV5EDkg3s) |
| [05](Session-05-Indirect-Optimal-Control/) | Indirect methods | `IndirectSingleE1.m`, `IndirectSingleE2.m` | [Watch](https://youtu.be/6Hmo3n-oWsc?list=PLJ5BV5EDkg3s) |
| [06](Session-06-Indirect-Multiple-Shooting-and-DAE/) | Indirect MS and DAE | `IndirectMultipleE2.m`, `DAESingleE2.m` | [Watch](https://youtu.be/LS2HpZe6cGQ?list=PLJ5BV5EDkg3s) |
| [07](Session-07-Dynamic-Programming-and-LQR/) | DP and LQR | `Dynamic_Programming.m`, `LQR_design.m`, `closed_loop.m`, helpers | [Watch](https://youtu.be/-G95pVp0-E8?list=PLJ5BV5EDkg3s) |

## Requirements

MATLAB, CasADi, IPOPT, CVODES/IDAS. Session 2 Example 6 needs BONMIN. Session 7 needs Control System Toolbox (`dlqr`).

```matlab
addpath('C:\\path\\to\\casadi')
import casadi.*
```

Then `cd` into a session folder and run the listed script.
