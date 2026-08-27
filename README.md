# Workshop Materials

Hands-on source codes and lecture materials for three university workshops in **numerical optimal control**, **model predictive control**, and **distributed optimization**.

**Lecturers:** Mohammadreza Ghobadzadeh & Hamzeh Kashi Yarandi 
**Affiliation:** School of Electrical and Computer Engineering, University of Tehran  
**Labs:** Smart Network Systems Laboratory · Advanced Control Systems Laboratory (ACSL) · Process Control Laboratory, K. N. Toosi University of Technology

Every session folder in this repository contains its own notes **and the implementation files**. You do not need any other GitHub repository to download or run the codes.

## Workshops

| Folder | What you get | Tools | Lectures |
| --- | --- | --- | --- |
| [Numerical-Optimal-Control-Workshop](Numerical-Optimal-Control-Workshop/) | 7 sessions with MATLAB/CasADi scripts | MATLAB, CasADi | [Playlist]([https://www.youtube.com/@Control_Research_Team/playlists](https://www.youtube.com/playlist?list=PLJ5BV5EDkg3s)) |
| [Model-Predictive-Control-using-CasADi](Model-Predictive-Control-using-CasADi/) | MPC overview, CasADi/AD, single- and multiple-shooting MPC | MATLAB, CasADi, IPOPT | [Playlist]([https://www.youtube.com/playlist?list=PLUtae4hCv9Go](https://www.youtube.com/playlist?list=PLUtae4hCv9Go)) |
| [Distributed-Optimization-Workshop](Distributed-Optimization-Workshop/) | 7 CVXPY notebooks + 15 CasADi examples | Python/CVXPY, MATLAB/CasADi | [Playlist]([https://www.youtube.com/playlist?list=PLU_FeksUzG_k](https://www.youtube.com/playlist?list=PLU_FeksUzG_k)) |

## How to use

```bash
git clone https://github.com/Mohammadreza-Ghobadzadeh/Workshop-Materials.git
cd Workshop-Materials
```

1. Open the workshop folder you need.
2. Read that folder’s `README.md`.
3. For CVXPY: `pip install -r Distributed-Optimization-Workshop/requirements.txt`
4. For MATLAB/CasADi: add *your* CasADi path, then run the `.m` file in the session folder.

```matlab
addpath('C:\\path\\to\\casadi')
import casadi.*
```

## Lecturers and attribution

Workshop organization, Persian lectures, and many implementation files were prepared by the lecturers above. Some numerical examples follow established educational sources (CasADi docs, SysCOP/Freiburg notes, CVXPY examples). See each package `ACKNOWLEDGEMENTS.md`.

No repository-wide open-source license is applied.
