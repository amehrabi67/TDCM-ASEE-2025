# Tracking Engineering Students’ Misconceptions with TDCM in R

## Overview

This repository contains the full workflow and data preparation steps to model **student misconceptions** using the **TDCM** R package, based on responses to the **Force Concept Inventory (FCI)**.  The question are available from: https://ia902906.us.archive.org/6/items/X78YS78YQ7SYXS78Q/Force%20Concept%20Inventory.pdf.
The goal is to **track conceptual changes over time** (pre- to post-test) for 1,529 engineering students across six institutions.
We model using the **Deterministic Inputs, Noisy "Or" Gate (DINO)** logic and apply a **Transition Diagnostic Classification Model (TDCM)** to understand misconception mastery transitions across four major physics concepts.

## Abstract:

    This study investigates the identification and persistence of misconceptions among engineering students in foundational STEM courses, focusing on physics concepts assessed through the Force Concept Inventory (FCI). Misconceptions, defined as systematic and deeply rooted alternative understandings, hinder students’ ability to master complex topics and apply knowledge effectively. Traditional models such as Item Response Theory and Cognitive Diagnostic Models are limited in their ability to track misconceptions over time, failing to capture how these erroneous beliefs evolve or persist across assessments. To address this gap, we employ a Transition Diagnostic Classification Model (TDCM) that incorporates a Q-matrix to map misconceptions to test items and monitor their transitions as distinct cognitive attributes over successive evaluations. Using data from 1,529 engineering students who completed pre- and post-tests in the Force Concept Inventory, the TDCM reveals the persistence and evolution of misconceptions in areas such as Force and Motion and Vector Addition. Misconceptions in Force and Motion, often aligned with intuitive but incorrect reasoning, exhibit strong persistence, while misconceptions in Vector Addition are more frequently acquired but less stable. These findings align with Conceptual Change Theories, which emphasize the coherence and resistance of misconceptions as cognitive structures embedded in students’ mental models. By analyzing transition probabilities and reliability metrics, the TDCM offers actionable insights for educators, facilitating targeted interventions. This study demonstrates the TDCM’s effectiveness in enhancing conceptual understanding, supporting data-driven strategies to address persistent misconceptions, and improving outcomes in engineering education.

---
## Repository Contents
- `code/` — R scripts for data processing, model fitting, and result summarization.
- `data/` — Preprocessed data files (pre-test and post-test responses).
- `qmatrix/` — Q-matrix linking items to misconceptions.
- `results/` — Estimated parameters, transition probabilities, and reliability outputs.

---
## How to Run

1. Install and load necessary R libraries:
   ```r
   install.packages("TDCM")
   install.packages("readxl")
   install.packages("dplyr")
   library(TDCM)
   library(readxl)
   library(dplyr)
   ```
2. Clone this repository and place the Excel data files and Q-matrix in the correct folders.


## Setting of Study

- **Sample**: 1,529 engineering students from six institutions.
- **Assessment**: Force Concept Inventory (FCI) on the LASSO platform.
- **Goal**: Track conceptual change regarding four misconceptions:  
  - Force and Motion  
  - Vector Addition  
  - Friction  
  - Acceleration and Velocity

A detailed **Q-matrix** maps each question to the misconceptions it targets.  
The **TDCM** framework models changes in mastery status between pre- and post-tests.

---

## References

- Madison, M. J., & Cotterell, M. E. (2024). *Introduction to the TDCM Package*. Retrieved from [https://cran.r-project.org/web/packages/TDCM/vignettes/TDCM.html](https://cran.r-project.org/web/packages/TDCM/vignettes/TDCM.html)
- Madison MJ, Bradshaw LP. (2018). *Assessing Growth in a Diagnostic Classification Model Framework*. Psychometrika, 83(4), 963–990. [https://doi.org/10.1007/s11336-018-9638-5](https://doi.org/10.1007/s11336-018-9638-5)
- Henson RA, Templin JL, Willse JT. (2009). *Defining a Family of Cognitive Diagnosis Models Using Log-Linear Models with Latent Variables*. Psychometrika, 74(2), 191–210. [https://doi.org/10.1007/s11336-008-9089-5](https://doi.org/10.1007/s11336-008-9089-5)

---

## Data Access

**Note**: The student response dataset is not publicly posted here.  
**If needed, please contact**: **Dr. Jason Morphew** at **jmorphew@purdue.edu** for access to the anonymized dataset.

---

## Citation

Mehrabi, A., & Morphew, J. W. (2025). Uncovering the cognitive roots of misconceptions in physics education for engineering students through transitional diagnostic models. 2025 Annual Conference of American Society of Engineering Education, Canada.
