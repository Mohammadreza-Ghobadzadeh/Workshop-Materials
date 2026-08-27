# Workshop Materials

Educational source codes and session materials for university workshops in optimization, optimal control, and model predictive control.

**Affiliation:** School of Electrical and Computer Engineering, University of Tehran  
**Laboratories:** Smart Network Systems Laboratory · Advanced Control Systems Laboratory (ACSL)

This repository collects three GitHub-ready workshop packages. Each folder is self-contained and includes its own README, session notes, and (where applicable) code and acknowledgements.

## Workshops

| Folder | Workshop | Tools | Lectures |
| --- | --- | --- | --- |
| [Distributed-Optimization-Workshop](Distributed-Optimization-Workshop/) | Distributed Optimization — theory, algorithms, and applications | CVXPY, CasADi | [CVXPY playlist](https://www.youtube.com/playlist?list=PLU_FeksUzG_k) |
| [Model-Predictive-Control-using-CasADi](Model-Predictive-Control-using-CasADi/) | Model Predictive Control using CasADi | MATLAB, CasADi | See workshop README |
| [Numerical-Optimal-Control-Workshop](Numerical-Optimal-Control-Workshop/) | Numerical Optimal Control | MATLAB, CasADi | [Control Research Team playlists](https://www.youtube.com/@Control_Research_Team/playlists) |

## Repository Structure

```text
Workshop-Materials/
├── README.md
├── .gitignore
├── Distributed-Optimization-Workshop/
├── Model-Predictive-Control-using-CasADi/
└── Numerical-Optimal-Control-Workshop/
```

## How to Use

1. Open the folder of the workshop you need.
2. Read that workshop’s `README.md` for session order, software requirements, and lecture links.
3. Install the listed dependencies (Python/CVXPY for the distributed-optimization CVXPY track; MATLAB + CasADi for the control workshops).
4. Work through the session folders in order.

Do not assume a single CasADi install path. Add CasADi to the MATLAB path on your own machine before running `.m` files.

## Lecturers and Attribution

Workshop lecturers, laboratory affiliations, and third-party educational sources are documented inside each package (`README.md` and `ACKNOWLEDGEMENTS.md` where present). Some examples are original workshop material; others are adapted from established teaching resources. Check those files before reuse or redistribution.

## License

No repository-wide open-source license is applied. Individual examples may remain subject to the terms of their original educational sources.
