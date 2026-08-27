# Numerical Optimal Control Workshop

Persian-language workshop with hands-on MATLAB and CasADi implementations.

**Lecturers:** Mohammadreza Ghobadzadeh & Hamzeh Kashi Yarandi 
**Host:** Advanced Control Systems Laboratory (ACSL), University of Tehran  
**Lectures:** [Control Research Team playlists](https://www.youtube.com/@Control_Research_Team/playlists)

All session codes live **in this folder**. Download or clone [Workshop-Materials](https://github.com/Mohammadreza-Ghobadzadeh/Workshop-Materials) and open the session you need.

## Sessions and files

| Session | Topic | Codes in this repo | Lecture |
| --- | --- | --- | --- |
| [01](Session-01-Foundations-and-CasADi/) | CasADi foundations | `Symbolics.m`, `Function_Objects.m` | [Watch](https://youtu.be/L3QsqFfRAtQ?si=0In9s2R57aoKff4p) |
| [02](Session-02-Numerical-Optimization/) | Numerical optimization | `Example1.m` … `Example6.m` | [Watch](https://youtu.be/F-p0v5NFCwQ?si=TDOtR6225DuUES8s) |
| [03](Session-03-Direct-Single-Shooting/) | Direct single shooting | `SingleShooting.m` | [Watch](https://youtu.be/g_bZyt_Jphc?si=mGnB9G52lsqyACrN) |
| [04](Session-04-Direct-Multiple-Shooting/) | Direct multiple shooting | `DirectMultipleShooting.m` | [Watch](https://youtu.be/heRA5tGjCqw?si=SKKhuWiIq4aBcLyX) |
| [05](Session-05-Indirect-Optimal-Control/) | Indirect methods | `IndirectSingleE1.m`, `IndirectSingleE2.m` | [Watch](https://youtu.be/6Hmo3n-oWsc?si=5eAGAuoRd9KfhVML) |
| [06](Session-06-Indirect-Multiple-Shooting-and-DAE/) | Indirect MS and DAE | `IndirectMultipleE2.m`, `DAESingleE2.m` | [Watch](https://youtu.be/LS2HpZe6cGQ?si=ZEMmwjXMM6TnJGeD) |
| [07](Session-07-Dynamic-Programming-and-LQR/) | DP and LQR | `Dynamic_Programming.m`, `LQR_design.m`, `closed_loop.m`, helpers | [Watch](https://youtu.be/-G95pVp0-E8?si=6HzjDASo1TdQML5J) |

## Requirements

MATLAB, CasADi, IPOPT, CVODES/IDAS. Session 2 Example 6 needs BONMIN. Session 7 needs Control System Toolbox (`dlqr`).

```matlab
addpath('C:\\path\\to\\casadi')
import casadi.*
```

Then `cd` into a session folder and run the listed script.
