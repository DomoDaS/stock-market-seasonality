# Stock Market Seasonality & Performance Analysis

**Author:** Dominique DaSilva  
**Tools:** SQL (Google BigQuery), Tableau  
**Data Source:** Yahoo Finance historical prices  

---

## Project Overview
This project investigates whether stock markets follow a **seasonal performance pattern**—for example, if certain months consistently yield higher returns than others.  
The analysis focuses on **monthly returns**, aggregated over multiple years, to uncover recurring trends and potential anomalies.

---

## Business Question
Do specific calendar months show statistically stronger or weaker returns, and can these patterns inform investment timing strategies?

---

## Data & Methodology
- Pulled daily price data for major U.S. indices via Yahoo Finance API.  
- Loaded data into BigQuery for cleaning and transformation.  
- Calculated monthly returns using `LAG()` and `DATE_TRUNC()` functions.  
- Averaged returns by month to observe recurring performance.  

---

## SQL Highlights
- Window functions for month-over-month change calculations.  
- Time-series aggregation and date formatting.  
- Performance ranking by month for seasonality analysis.  

View the full SQL code → [queries.sql](./queries.sql)

---

##  Key Findings
Historically strong average returns in **April** and **November**.  
Weak or negative performance in **September**, consistent with market folklore.  
Demonstrates seasonality patterns that can guide portfolio strategy evaluation.  

---

## Visualization
Interactive trend chart available in Tableau Public (showing average return by month):  
View Dashboard on Tableau Public 
https://public.tableau.com/app/profile/dominique.dasilva/viz/SeasonalTrendsinU_S_StockIndices20102024/Dashboard1

---

## Tools & Technologies
- SQL (BigQuery)  
- Tableau (optional visualization)  
- GitHub (for documentation)  

---

## 📬 Contact
**Dominique DaSilva**  

📧 Email: domodasilva@yahoo.com

💼 LinkedIn: https://www.linkedin.com/in/dominique-dasilva-2a2b93384/

🌐 GitHub: https://github.com/DomoDaS
