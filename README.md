# Replication of “Community-Based Fact-Checking on Twitter’s Birdwatch Platform”

By: Aisha Malik (CUNY Hunter College) & Vanessa Reino (Rider University)

## Overview

This project is a replication of the paper:

> **Community-Based Fact-Checking on Twitter’s Birdwatch Platform**
> *Nicolas Proellochs, JLU Giessen, Germany*
> [arXiv:2104.07175](https://arxiv.org/abs/2104.07175)
> Contact: [nicolas.proellochs@wi.jlug.de](mailto:nicolas.proellochs@wi.jlug.de)

This replication effort was inspired by a talk by **Johan Ugander** at the Microsoft Research Lab in New York.

We replicate the results for Figures **2–4, 5c, and 7–10** from the original paper using publicly available Birdwatch (now Community Notes) data.

In addition to the replication, we propose a **conceptual extension** that explores how political bias might influence users' evaluations of Community Notes.

You can view the full interactive HTML report, including all replicated figures, [**here**](https://rawcdn.githack.com/msr-ds3/community-notes-2025-group-5/c7e83ecd8ca608e951db509c2c5d3cf3e24ecc98/05_birdwatch_report.html#Logistic_Regression)

---

## Requirements

To run the analysis, make sure the following R packages are installed:

| **Library**  | **Purpose**                                                                                                                                         |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `here`       | Ensures consistent, portable file paths for accessing project directories.                                                                          |
| `scales`     | Provides functions to format and scale data values for plots and tables.                                                                            |
| `tidyverse`  | A suite of packages (`dplyr`, `ggplot2`, `tidyr`, etc.) for data manipulation and visualization.                                                    |
| `readr`      | Fast and friendly functions for reading rectangular data (CSV, TSV).                                                                                |
| `parameters` | Extracts and interprets model parameters, especially useful for regression output.                                                                  |
| `MASS`       | Provides functions and datasets to support Venables and Ripley's *Modern Applied Statistics with S*. Includes tools for fitting statistical models. |
| `broom`      | Converts statistical analysis objects (e.g., models) into tidy data frames for easy plotting and comparison.                                        |

> You will also need a **Bash shell** to execute the `.sh` scripts located in the **main repository folder**. These scripts automate downloading and formatting of Birdwatch data.

To install all packages in R:

```r
install.packages(c("here", "scales", "tidyverse", "readr", "parameters", "MASS", "broom"))
```

---

## Replication Steps

1. **Read the paper**
   Focused replication of Figures **2, 3, 4, 5c, 7a, 7b, 8, 9, and 10**.

2. **Download Data**
   Run the following shell scripts from the main directory to download and prepare the Birdwatch data:

   * `01_download_notes_data.sh`
   * `02_filter_notes_data.sh`
   * `03_download_ratings.sh`
   * `04_reformat_ratings.sh`

3. **Analyze in R**
   The notebook `05_birdwatch_report.Rmd` contains the full analysis code and commentary.

4. **Render Report**
   Use `rmarkdown::render("05_birdwatch_report.Rmd")` to generate the final `HTML` report.

---

## Data Sources

* **Notes Data**
  [Community Notes Notes Data](https://ton.twimg.com/birdwatch-public-data/2025/06/16/notes/notes-00000.zip)

* **Ratings Data**
  Patterned as:
  `https://ton.twimg.com/birdwatch-public-data/2025/06/16/noteRatings/ratings-000xx.zip`
  (where `xx` ranges from `00` to `19`)

* **Documentation**
  [Community Notes Guide](https://communitynotes.x.com/guide/en/under-the-hood/ranking-notes)

---

## Limitations & Data Notes

* Our dataset was slightly smaller than that used in the original paper, containing **9,377 notes** and **45,885 ratings**, compared to **11,802 notes** and **52,981 ratings** in the original study.

* Features including **sentiment** and **text complexity** were not included in the regression analysis, as these required additional NLP processing.

---

## Conceptual Extension: Political Leaning & Bias (RQ6)

**Research Question:**

> How does the political leaning of Birdwatch users — ranging from conservative to democratic — influence their likelihood of rating Community Notes as “misleading” or “not misleading,” especially on politically charged tweets?

**Goal:**
This question aims to explore whether **user-assigned political orientation** affects the evaluation of fact-checking content within Community Notes. Unlike previous analyses that focused on the **content of tweets or notes themselves**, this conceptual extension shifts the lens to **user behavior and cognitive bias**. Specifically, how individuals with different ideological leanings assess the credibility of the same information.

The objective is to uncover **systemic patterns** that may reveal how political identity influences the interpretation of fact-checking efforts. This includes examining whether users across the political spectrum rate the same notes differently, particularly when notes are associated with politically sensitive or polarizing topics.

Ultimately, this research question seeks to:

* Identify **potential bias** in crowdsourced fact-checking processes,
* Analyze **credibility attribution** trends among users with varying political leanings,
* Contribute to the understanding of **ideological influence on collective moderation systems**, such as Community Notes.

---

## Team Notes

* All code is written to be reproducible and transparent.
* Please cite the original authors for any derived work or insights.
* Special thanks to the MSR DS3 team and Johan Ugander for the inspiration.