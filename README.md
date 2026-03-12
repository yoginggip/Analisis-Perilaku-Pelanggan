# Analisis-Perilaku-Pelanggan
Data analysis project exploring customer shopping behavior, spending patterns, product performance, and customer segmentation using Python, SQL, and Power BI.

# Customer Shopping Behavior Analysis: End-to-End Data Project

# Project Overview
[cite_start]This project analyzes customer shopping behavior using transactional data from 3,900 purchases across various product categories[cite: 3]. [cite_start]The primary goal is to uncover actionable insights into spending patterns, customer segments, product preferences, and subscription behavior to guide strategic business decisions and optimize marketing strategies[cite: 4].

# Dataset Summary
[cite_start]The dataset consists of **3,900 rows and 18 columns**[cite: 6, 7], capturing a comprehensive view of customer interactions:
- [cite_start]**Demographics:** Age, Gender, Location, Subscription Status[cite: 9].
- [cite_start]**Purchase Details:** Item Purchased, Category, Purchase Amount, Season, Size, Color[cite: 10].
- [cite_start]**Shopping Behavior:** Discount Applied, Previous Purchases, Frequency of Purchases, Review Rating, Shipping Type[cite: 11].

# Tech Stack & Methodology
This end-to-end project was executed in three main phases:

#1. Data Preparation & Cleaning (Python / Pandas)
- [cite_start]**Data Imputation:** Handled 37 missing values in the `Review Rating` column by imputing the median rating specific to each product category[cite: 12, 19].
- [cite_start]**Standardization:** Renamed all columns to `snake_case` format to ensure readability and seamless database integration[cite: 20].
- [cite_start]**Feature Engineering:** - Created an `age_group` column by binning customer ages for demographic analysis[cite: 22].
  - [cite_start]Generated a `purchase_frequency_days` column derived from purchase data[cite: 23].
- [cite_start]**Data Quality:** Identified redundancy between discount and promo columns, dropping the `promo_code_used` column to maintain data consistency[cite: 24]. [cite_start]The cleaned dataset was then pushed to a PostgreSQL database[cite: 25].

### 2. Exploratory Data Analysis (SQL / PostgreSQL)
Structured queries were used to extract business intelligence:
- [cite_start]**Demographic Spend:** Male customers generated significantly higher total revenue ($157,890) compared to female customers ($75,191)[cite: 28, 33, 34, 36, 37]. 
- [cite_start]**Age Group Contribution:** Young Adults led the revenue generation with $62,143, followed closely by the Middle-aged segment ($59,197)[cite: 60, 65, 66, 68, 71].
- [cite_start]**Customer Segmentation:** Classified the user base into Loyal (3,116 customers), Returning (701), and New (83) segments based on their historical purchase frequency[cite: 53, 54].
- [cite_start]**Subscription Dynamics:** Non-subscribers constitute the majority (2,847 users), though the average spend between subscribers ($59.49) and non-subscribers ($59.87) remains nearly identical[cite: 47, 49].
- [cite_start]**Product Performance:** Identified the top 5 highest-rated products, led by Gloves (3.86) and Sandals (3.84) [cite: 42, 43][cite_start], as well as the most discount-dependent items like Hats (50% discount rate)[cite: 50, 52].

### 3. Data Visualization (Power BI)
[cite_start]Developed an interactive Customer Behavior Dashboard summarizing key metrics[cite: 77, 81]:
- [cite_start]Global KPIs including 3.9K Total Customers, $59.76 Average Purchase Amount, and 3.75 Average Review Rating[cite: 82, 83, 84, 85, 86, 87].
- [cite_start]Visual breakdowns of customer percentage by subscription status (27% Yes, 73% No)[cite: 91, 94, 105].
- [cite_start]Granular charts detailing Revenue and Sales distributed by Product Category and Age Group[cite: 92, 95, 103, 109, 111].

# Strategic Business Recommendations
Based on the data analysis, the following actions are recommended to drive business growth:
1. [cite_start]**Boost Subscriptions:** Promote exclusive benefits and targeted offers to incentivize the large pool of non-subscribers to upgrade[cite: 115].
2. [cite_start]**Customer Loyalty Programs:** Implement reward systems specifically for repeat buyers to successfully transition them into the highly valuable "Loyal" segment[cite: 118].
3. [cite_start]**Review Discount Policy:** Re-evaluate discounting strategies on heavily discounted items (e.g., Hats and Sneakers) to balance sales volume with profit margin control[cite: 119].
4. [cite_start]**Product Positioning:** Actively feature top-rated products (Gloves, Sandals) and best-sellers in front-page marketing campaigns[cite: 120].
5. [cite_start]**Targeted Marketing:** Direct marketing resources toward the highest-revenue demographic (Young Adults) and users preferring express shipping[cite: 121].

# Repository Structure
```text
├── data/
│   ├── raw_data.csv          # Original dataset
│   └── cleaned_data.csv      # Data after Python preprocessing
├── notebooks/
│   └── data_cleaning.ipynb   # Python/Pandas scripts for cleaning and feature engineering
├── sql/
│   └── analysis_queries.sql  # PostgreSQL queries used for EDA
├── dashboard/
│   └── dashboard.pbix        # Power BI dashboard file
└── README.md
