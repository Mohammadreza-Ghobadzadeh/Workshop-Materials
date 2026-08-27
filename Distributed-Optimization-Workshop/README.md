# Distributed Optimization Workshop

### Theory, Algorithms, and Applications using CVXPY and CasADi

**Persian-language workshop**  
**Smart Network Systems Laboratory**  
**University of Tehran**

**Lecturers:** Mohammadreza Ghobadzadeh & Hamzeh Kashi Yarandi  
**Tracks:** CVXPY (7 sessions) · CasADi (15 sessions)

Full playlist (22 videos): [Distributed Optimization Workshop](https://www.youtube.com/playlist?list=PLU_FeksUzG_k)

## About the Workshop

This folder contains source codes and computational materials for the Distributed Optimization Workshop, developed and delivered through the Smart Network Systems Laboratory at the University of Tehran.

The workshop has two recorded tracks:

- **CVXPY Track** — seven Python notebooks (foundations through SVM/ADMM)
- **CasADi Track** — fifteen lecture videos plus MATLAB/CasADi example scripts

## CVXPY Track

| Session | Topic | Notebook | Video |
| --- | --- | --- | --- |
| 1 | [CVXPY Foundations](CVXPY/Session-01-CVXPY-Foundations/) | `CVXPY Tutorial.ipynb` | [Watch](https://www.youtube.com/watch?v=DfwB1kpxtg8) |
| 2 | [Linear Programming](CVXPY/Session-02-Linear-Programming/) | `Linear Programming.ipynb` | [Watch](https://www.youtube.com/watch?v=ok0VZaVsPJM) |
| 3 | [Quadratic Programming](CVXPY/Session-03-Quadratic-Programming/) | `Quadratic Programming.ipynb` | [Watch](https://www.youtube.com/watch?v=5gtIxgqvq-4) |
| 4 | [Mixed-Integer Programming](CVXPY/Session-04-Mixed-Integer-Programming/) | `Mixed-Integer Programming.ipynb` | [Watch](https://www.youtube.com/watch?v=UEnY_X1MLqg) |
| 5 | [Nonlinear / Geometric Programming](CVXPY/Session-05-Nonlinear-and-Geometric-Programming/) | `Nonlinear Programming.ipynb` | [Watch](https://www.youtube.com/watch?v=DYGtP6uJCyY) |
| 6 | [Optimal Control with CVXPY](CVXPY/Session-06-Optimal-Control/) | `Optimal Control.ipynb` | [Watch](https://www.youtube.com/watch?v=B7mxVeqvzns) |
| 7 | [Support Vector Machines & ADMM](CVXPY/Session-07-SVM-and-ADMM/) | `SVM.ipynb` | [Watch](https://www.youtube.com/watch?v=VeiT64vadDI) |

## CasADi Track

Fifteen lecture videos from the same playlist, listed in session order.

| Session | Title | Video |
| --- | --- | --- |
| 1 | CasADi Session 1 | [Watch](https://www.youtube.com/watch?v=lg0D7HSHQLk) |
| 2 | CasADi Session 2 | [Watch](https://www.youtube.com/watch?v=k6M36N7UsuE) |
| 3 | CasADi Session 3 | [Watch](https://www.youtube.com/watch?v=iasTBBoRAhM) |
| 4 | CasADi Session 4 | [Watch](https://www.youtube.com/watch?v=VMdEfVO0hlo) |
| 5 | CasADi Session 5 | [Watch](https://www.youtube.com/watch?v=dEmtw3k7Pmo) |
| 6 | CasADi Session 6 | [Watch](https://www.youtube.com/watch?v=a5Ja1_T1jXQ) |
| 7 | CasADi Session 7 | [Watch](https://www.youtube.com/watch?v=aLVgnf1Bbw4) |
| 8 | CasADi Session 8 | [Watch](https://www.youtube.com/watch?v=18fm0XzUmBs) |
| 9 | CasADi Session 9 | [Watch](https://www.youtube.com/watch?v=_q6AT5Qo5EY) |
| 10 | CasADi Session 10 | [Watch](https://www.youtube.com/watch?v=YBO9AcKQ4xU) |
| 11 | CasADi Session 11 | [Watch](https://www.youtube.com/watch?v=FZzyTAYEes4) |
| 12 | CasADi Session 12 | [Watch](https://www.youtube.com/watch?v=zLYsXjHnrKc) |
| 13 | CasADi Session 13 | [Watch](https://www.youtube.com/watch?v=ZmbiOoLiGZQ) |
| 14 | CasADi Session 14 | [Watch](https://www.youtube.com/watch?v=_QaWBbzf69k) |
| 15 | CasADi Session 15 | [Watch](https://www.youtube.com/watch?v=emjMFREUNrA) |

MATLAB example scripts that accompany the CasADi track are in [`CasADi/`](CasADi/):

| File | Description |
| --- | --- |
| [`E1.m`](CasADi/E1.m) | Unconstrained scalar quadratic optimization with CasADi and IPOPT |
| [`E2.m`](CasADi/E2.m) | Bounded nonlinear optimization of a sinusoidal objective |
| [`E3.m`](CasADi/E3.m) | Least-squares line fitting formulated as a nonlinear program |
| [`E4.m`](CasADi/E4.m) | Constrained quadratic optimization with inequality constraints |
| [`E5.m`](CasADi/E5.m) | Constrained box-volume maximization |
| [`E6.m`](CasADi/E6.m) | Finite-horizon mobile-robot optimal control (single shooting) |

## Software Requirements

### CVXPY track

```bash
pip install -r requirements.txt
```

### CasADi track

MATLAB, CasADi, and IPOPT. Add CasADi to the MATLAB path before running the `.m` files:

```matlab
addpath('C:\\path\\to\\casadi')
import casadi.*
```

See [ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md) for educational references. No repository-wide open-source license is currently applied.
