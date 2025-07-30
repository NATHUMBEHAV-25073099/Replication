# Replication Package: [NATHUMBEHAV-25073099]

This repository contains all materials required to replicate the analysis in our manuscript:  
**AI-assisted Programming May Decrease the Productivity of Experienced Developers by Increasing Maintenance Burden**  
**Authors**: Blinded for Peer Review

All data were collected from GitHub.com using the GitHub GraphQL APIs. The replication analysis is conducted entirely in **Stata**.

---

## Contents

- `/Replication Code and Data/`: Stata `.do` files to reproduce the results, and `.xlsx` datasets  
- `/graphs/`: Output graphs and plots
- `/Data Collection Queries/`: The GitHub GraphQL (API) queries used to collect both individual and project level data from Github. 
- `README.md`: This file  

---

## 1. System Requirements

- **Software**:  
  - Stata 17 or later (tested on Stata/SE 17.0)  
  - Required user-written Stata packages (install via `ssc install`):  
    - `coefplot`  
    - `ftools`  
    - `reghdfe`  

- **Hardware**:  
  - Standard desktop or laptop with at least 8GB RAM  
  - No non-standard hardware required  

---

## 2. Installation Guide

1. Clone or download this repository.  
2. Ensure that the `.do` files and the dataset files are in the same directory.  
3. Open the `.do` files using Stata 17 or later.  

> **Estimated setup time**: ~5 minutes on a standard desktop computer.

---

## 3. Replication Instructions - Analysis and Results from Manuscript

### Step 1: Open the `.do` Files  
The folder contains multiple `.do` files, each corresponding to a specific table or result in the manuscript. Open any of these files in Stata to reproduce the associated analysis.

### Step 2: Run the Analysis  
- The `.do` files are numbered to match the order in which results appear in the manuscript.  
- Running each script will:  
  - Load and prepare the relevant data  
  - Run the appropriate model (Difference-in-Differences and supporting analyses)  
  - Output tables and/or figures
> **Expected output**: Replication of tables and figures presented in the manuscript  
> **Expected runtime**: ~5–10 minutes on a standard desktop
---
## 4. Replication Instructions - Data Collection Using GitHub APIs
1. **Generate a GitHub Personal Access Token**  
   - Visit: [https://github.com/settings/tokens](https://github.com/settings/tokens)  
   - Create a token with **`repo`** and **`read:org`** scopes (no write access needed).

2. **Install a GraphQL Client** (optional)  
   - Use tools like [Insomnia](https://insomnia.rest/), [Postman](https://www.postman.com/), or command-line tools like `curl`.

3. **Access the Query Files**  
   - Navigate to the folder: [`/Data Collection Queries/`](https://github.com/NATHUMBEHAV-25073099/Replication/tree/main/Data%20Collection%20Queries)  
   - Select the relevant `.graphql` file based on the data type (e.g., contributors, issues, commits).

4. **Use the GitHub GraphQL API Endpoint**  
   - Endpoint: `https://api.github.com/graphql`

5. **Submit Queries**  
   - Paste the query into your GraphQL client or use a script to send the request.  
   - Set the HTTP header:  
     ```
     Authorization: Bearer YOUR_TOKEN
     ```

6. **Handle Pagination**  
   - Most queries use cursor-based pagination (`pageInfo`, `endCursor`).  
   - Update the `after` parameter to loop through pages and collect full results.

7. **Store Results**  
   - Save responses in JSON format.  
   - Convert and structure as needed (e.g., CSV or `.dta` for analysis in Stata).

> **Note**: Due to GitHub API rate limits, consider implementing short delays or token rotation when collecting large datasets.


---

## Notes

- All Stata output appears in the Results window or is saved to the `/graphs/` folder if graphical.  
- We recommend running the scripts in sequence for a complete replication.

---
