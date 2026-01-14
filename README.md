# AMD Stock Market Exploratory Data Analysis
Comprehensive exploratory data analysis of 46 years of AMD stock data (1980-2026).  SQL analytics, risk metrics, technical indicators, and interactive Tableau visualizations  to generate data-driven investment insights.


Executive Summary:


This comprehensive exploratory data analysis examines 46 years of AMD stock market performance (1980-2026), analyzing over 11,000 trading days to uncover investment patterns, risk profiles, and strategic opportunities. Using advanced SQL analytics and data visualization, I identified key performance drivers, volatility patterns, and technical indicators that inform investment decision-making.


Business Problem:


Individual investors and financial analysts need data-driven insights to make informed decisions about AMD stock investments. However, raw historical data alone doesn't provide:

  -What is the actual risk-adjusted return?

  -How risky is AMD compared to market benchmarks?

  -When are optimal entry and exit points?

  -What's the maximum potential loss (drawdown)?

  -Do moving averages provide actionable buy/sell signals?


Methodology:


1. I downloaded my dataset from Kaggle, then used Python to import said dataset into MySQLite DB.
2. I performed a Data Quality Assessment in MySQLite where I checked for impossible values, identified and investigated outliers using statistical methods, and validated date and trading day consistency.
3. Next I used SQL to run performance metrics, risk analysis and technical analysis on the cleaned dataset. 
4. I imported the dataset into Excel where I validated the data and made quick visualizations.
5. I then used Tableau to create an interactive dashboard creation as well as a few more graphs/charts.


Skills:


- SQL Expertise: Complex queries using window functions, CTEs, subqueries
- Statistical Analysis: Descriptive statistics, volatility measures, risk metrics
- Time Series Analysis: Trend identification, moving averages, seasonality detection
- Data Cleaning: Outlier detection, missing value handling, data validation
- Data Visualization: Multi-dimensional dashboard design in Tableau


Results and Business Recommendation:


Analysis of 46 years of AMD stock data (11,500+ trading days) reveals exceptional long-term growth potential with total returns of 6,576% (approximately 9.6% annualized CAGR), significantly outperforming market benchmarks. However, high volatility (59.1% annualized) and maximum drawdown of -96.6% indicate this is a growth stock best suited for risk-tolerant, long-term investors. Technical analysis shows the stock is currently between its 50-day ($226.17) and 200-day ($164.86) moving averages, signaling mixed momentum. 

Recommendation: For long-term investors (10+ year horizon), AMD represents a strong buy-and-hold opportunity with dollar-cost averaging to mitigate timing risk. Suggested position size: 3-5% of portfolio. Conservative investors should limit exposure to <2% or consider diversified semiconductor ETFs instead. Key entry points identified at 50-day moving average support level of $226.17 with stop-loss at $208.08 (8% below entry).

### Stock Price Growth Over 46 Years

![AMD Stock Price Growth](images/amd_price_growth.png) 

*AMD stock grew from $3.15 (1980) to $210.02 (2026), a 6,576% total return*


1. Connect to real-time market data API
2. Schedule daily refresh via Python script






