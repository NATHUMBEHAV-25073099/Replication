# Replication Package: [NATHUMBEHAV-25073099]

This repository contains all materials required to replicate the analysis in our manuscript:  
**AI-assisted Programming May Decrease the Productivity of Experienced Developers by Increasing Maintenance Burden**  
Authored by: Blinded for Peer Review 

All data were collected from GitHub.com using the GitHub GraphQL APIs. The replication analysis is conducted entirely in **Stata**.

---

## Contents

- `/Replication Code and Data/`: Stata `.do` files for running the models; Xlsx datasets to reproduce teh results 
- `/graphs/`: Output graphs and plots
- `README.md`: This file  

---

## 1. System Requirements

- **Software Dependencies**:  
  - **Stata 17** or later (tested on Stata/SE 17.0)  
  - Stata packages (SSC Install) - coefplot, ftools, reghdfe

- **Hardware Requirements**:  
  - Standard desktop or laptop with at least 8GB RAM  
  - No non-standard hardware needed  

---

## 2. Installation Guide

1. Clone or download this repository.
2. Open the `.do` files using Stata 17 or later.
3. Make sure the data and the do files are in the same folder

> **Estimated setup time**: ~5 minutes on a standard desktop computer.

---

## 3. Reproduction Instructions

### Step 1: Open the Do Files  
The do files comprise all the code to reproduce the results. Open the do file in stat and 'run' it. The folder contains multiple do files to reproduce specific tables from the manuscript.

### Step 2: Run Analysis  
- Open `xxx.do` files in Stata. We have numbered them so that you can replicate the results as teh tables appear i nthe manuscript.   
- Running the script will:
  - Load and prepare the data  
  - Perform the main Difference-in-Differences analyses  
  - Generate all tables and figures reported in the manuscript

> **Expected output**: All tables and figures is dispalyed in the manuscript
> **Expected runtime**: ~5–10 minutes on a standard desktop  
