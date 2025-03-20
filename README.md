# POP-Algorithms

This repository contains all code used in the survey paper _First Order Algorithms for Polynomial Optimization_. 

## Abstract

Semidefinite programming (SDP) relaxations are a powerful approach for solving polynomial optimization problems (POPs), yet their scalability remains a challenge. This paper surveys advancements in first-order methods for SDP relaxations, focusing on inexact projected gradient methods (iPGM) as proposed by Yang et al. (2021). Their method integrates projected gradient updates with rounding and nonlinear lifting strategies to efficiently solve rank-one SDP relaxations, enabling faster convergence and improved scalability. We contextualize this approach by reviewing related methodologies, including regularization techniques by Nie and Wang (2012) and Alternating Direction Method of Multipliers (ADMM) based sum-of-squares methods by Zheng et al. (2019). To validate iPGM’s effectiveness, we reproduce numerical results from Yang et al. (2021) using the STRIDE algorithm and detail key proofs of the STRIDE algorithm. This study provides empirical insights into computational efficiency, convergence behavior, and solution accuracy, offering acomparative assessment of first-order methods for SDP relaxations in polynomial optimization.
