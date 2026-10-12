# 🎵 SQL Case Study Assessment — Chinook Media Store Analytics

Welcome to the **SQL Case Study Assessment Portfolio** repository. This repository features two portfolio projects focused on **Digital Media Sales & Customer Analytics** using the relational **Chinook SQLite Database** (`chinook.db`).

The analysis addresses key business areas including sales trends, customer segmentation, geographical revenue distribution, artist/genre popularity, and customer lifetime value (LTV) metrics.

---

## 🚀 Projects Overview & Case Study Analysis

---

### 🔹 PROJECT 03: Music Store Sales & Customer Analytics

* **Suggested Resume Title:** Music Store Sales & Customer Analytics using SQL
* **Dataset:** Chinook Database (`chinook.db`)
* **Objective:** Analyze digital music store operations to evaluate revenue performance, geographic markets, customer spending habits, and catalog consumption.

#### 📌 Core Business Questions Solved:
1. **Total Revenue & Growth:** Evaluated total gross revenue, transaction counts, and annual/monthly sales performance trends.
2. **Geographical Revenue Distribution:** Identified top-performing countries (e.g., USA, Canada, Brazil) and calculated each country's percentage contribution to overall store revenue.
3. **Top Customers & Support:** Identified top 10 customers by total spend and mapped customer records to dedicated Support Representatives.
4. **Catalog & Genre Analytics:** Analyzed top-selling artists, albums, genres (Rock, MPEG audio), and tracks purchased most frequently.
5. **Inactive & Extreme Value Customers:** Querying customers who have above-average lifetime spending versus inactive user records.

#### 🛠️ SQL Concepts Applied:
* Multi-table `INNER JOIN` & `LEFT JOIN` (connecting `Customer`, `Invoice`, `InvoiceLine`, `Track`, `Album`, `Artist`, `Genre`).
* Data aggregations (`SUM`, `AVG`, `COUNT`), `GROUP BY`, `HAVING`.
* CTEs (`WITH` clauses) and Subqueries.
* Window functions (`RANK()`, `DENSE_RANK()`, `SUM() OVER()`).
* Date/Time functions for annual/monthly time-series extraction.

---

### 🔹 PROJECT 05: Customer Segmentation & Revenue Analytics

* **Suggested Resume Title:** Customer Segmentation & Revenue Analytics using SQL
* **Dataset:** Chinook Database (`chinook.db`)
* **Objective:** Build a comprehensive customer intelligence system using sales transaction logs to perform behavioral segmentation and lifetime value (LTV) analysis.

#### 📌 Core Business Questions Solved:
1. **Customer Behavioral Tiers:** Categorized active customer profiles into High-Value, Medium-Value, and Low-Value tiers using conditional `CASE WHEN` logic.
2. **Geographic Rankings:** Applied `DENSE_RANK() OVER (PARTITION BY Country ORDER BY Total_Spend DESC)` to isolate the Top 3 spending customers per country.
3. **Multi-Genre Preference Analysis:** Identified versatile buyers who purchase across multiple genres versus single-genre loyalists.
4. **Cumulative Revenue & Financials:** Computed cumulative running revenue using window functions (`SUM(Invoice_Total) OVER (ORDER BY InvoiceDate)`).
5. **Recency & Average Spend:** Computed lifetime average customer spending and identified inactive accounts without recent order dates.

#### 🛠️ SQL Concepts Applied:
* Conditional Business Logic (`CASE WHEN`).
* Advanced Window Functions (`ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `SUM() OVER()`).
* CTEs for multi-stage segmentation pipelines.
* Aggregations, multi-table relationship joins, and filtering.

---

## 💡 Key Business Recommendations

1. **Focus Marketing on Top-Tier Markets:** Focus digital campaigns on high-revenue regions (USA, Canada, Brazil) where high-value customers contribute the majority of revenue.
2. **Targeted Genre Promotions:** Leverage Rock and Alternative track popularity to construct tailored bundle recommendations for Medium and Low-value segments.
3. **Re-engagement Campaigns:** Launch re-engagement email incentives for identified inactive accounts with zero recent invoice activity.
