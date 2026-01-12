# Car-Sales-using-MySQL-and-PowerBI
Interactive Power BI dashboard analyzing car sales data for 2020-2021

## 📊 Project Overview

Interactive Power BI dashboard analyzing car sales data for 2020-2021, providing comprehensive insights into sales performance, trends, and customer preferences across multiple dimensions including dealer regions, car brands, body styles, and more.

## 🎯 Key Features

- **YTD Sales Metrics**: Track total sales ($672M), cars sold (24K), and average car price ($28.09K)
- **Sales Weekly Trend**: Visualize sales patterns across 2020-2021 with weekly granularity
- **Sales by Body Style**: Analyze performance across SUV, Sedan, Hatchback, Passenger, and Hardtop
- **Sales by Color**: Identify top-selling colors (Pale White 46%, Black 33%, Red 21%)
- **Company Sales Trend**: Compare performance across car manufacturers with revenue % and total %
- **Sales per Dealer Region**: Regional analysis showing top-performing locations
- **Interactive Filters**: Filter by Date, Body Style, Engine, Gender, and Transmission

## 📁 Project Structure

```
car-sales-dashboard/
├── data/
│   ├── raw/
│   │   └── car_sales.csv          # Original Kaggle dataset
│   └── processed/
│       ├── sales_per_region.csv
│       ├── sales_per_color.csv
│       ├── sales_per_company.csv
│       ├── sales_per_transmission.csv
│       ├── sales_per_engine.csv
│       ├── sales_by_dealer.csv
│       ├── sales_per_gender.csv
│       ├── gender_fav_color.csv
│       ├── fav_bodystyle_gender.csv
│       ├── ytd_total_sales.csv
│       ├── weekly_trend.csv
│       └── avg_car_price.csv
├── sql_queries/
│   └── car_sales_analysis.sql     # All MySQL queries
├── powerbi/
│   └── Car_Sales_Dashboard.pbix   # Power BI dashboard file
├── screenshots/
│   └── dashboard_preview.png      # Dashboard screenshot
└── README.md
```

## 🛠️ Technologies Used

- **Database**: MySQL
- **Visualization**: Power BI Desktop
- **Data Source**: [Kaggle - Car Sales Dataset](https://www.kaggle.com/)
- **Export Format**: CSV

## 📥 Data Source

Dataset obtained from Kaggle's Car Sales dataset, containing sales transactions from 2020-2021 with the following attributes:
- Date, Dealer, Dealer Region
- Company (Brand), Model, Body Style
- Color, Engine, Transmission
- Price, Gender
- And more...

## 🔍 SQL Queries Overview

### 1. **Sales Per Dealer Region**
```sql
SELECT Dealer_Region, SUM(price) 
FROM cars
GROUP BY Dealer_Region;
```

### 2. **Sales Per Color**
```sql
SELECT Color, SUM(price) 
FROM cars
GROUP BY Color;
```

### 3. **Sales Per Company**
```sql
SELECT Company, SUM(price) 
FROM cars
GROUP BY Company;
```

### 4. **YTD Total Sales with Revenue %**
```sql
SELECT 
    Company,
    COUNT(*) as YTD_Car_Sold,
    ROUND(AVG(Price), 2) as YTD_Avg_Price,
    SUM(Price) as YTD_Total_Sales,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()), 2) as Percentage_Total,
    ROUND((SUM(Price) * 100.0 / SUM(SUM(Price)) OVER ()), 2) as Revenue_Percentage
FROM cars
WHERE Date BETWEEN '2020-01-01' AND '2021-12-31'
GROUP BY Company
ORDER BY YTD_Total_Sales DESC;
```

### 5. **Weekly Sales Trend**
```sql
SELECT 
    YEAR(Date) as Year,
    WEEK(Date) as Week,
    DATE_FORMAT(Date, '%Y-W%u') as Week_Label,
    COUNT(*) as Total_Sales,
    SUM(Price) as Total_Revenue
FROM cars
WHERE YEAR(Date) IN (2020, 2021)
GROUP BY YEAR(Date), WEEK(Date), DATE_FORMAT(Date, '%Y-W%u')
ORDER BY Year, Week;
```

*For complete list of queries, see `sql_queries/car_sales_analysis.sql`*

## 📊 Dashboard Components

### Key Metrics Cards
- **Total Sales**: $672M
- **Total Car Sold**: 24K
- **Avg Car Price**: $28.09K

### Visualizations
1. **Sales Weekly Trend** - Line chart showing weekly sales patterns
2. **Total Sales by Body Style** - Bar chart with percentage breakdown
3. **Total Sales by Color** - Donut chart highlighting color preferences
4. **Company Sales Trend** - Table with detailed metrics per manufacturer
5. **Sales per Dealer Region** - Horizontal bar chart of regional performance

### Interactive Filters
- Date Range (02-01-2020 to 31-12-2021)
- Body Style
- Engine Type
- Gender
- Transmission Type

## 🚀 How to Use

### Prerequisites
- MySQL Server
- Power BI Desktop
- Original car sales dataset from Kaggle

### Setup Instructions

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/car-sales-dashboard.git
cd car-sales-dashboard
```

2. **Import data to MySQL**
```bash
# Load the raw CSV data into MySQL
mysql -u root -p
CREATE DATABASE car_sales;
USE car_sales;
# Import your car_sales.csv file
```

3. **Run SQL queries**
```bash
# Execute queries from sql_queries/car_sales_analysis.sql
# Export results as CSV files to data/processed/
```

4. **Open Power BI**
- Open `Car_Sales_Dashboard.pbix` in Power BI Desktop
- Update data source paths if needed
- Refresh data connections

5. **Explore the Dashboard**
- Use slicers to filter data
- Hover over visuals for detailed tooltips
- Click on elements for cross-filtering

## 📈 Key Insights

- **Top Performing Region**: Austin ($117M in sales)
- **Most Popular Body Style**: SUV (25.41% of total sales, $171M)
- **Preferred Color**: Pale White dominates with 46% market share
- **Leading Brand**: Chevrolet leads with 1,819 cars sold and 7.61% total market share
- **Average Transaction**: $28,090 per vehicle
- **Peak Sales Period**: Identified through weekly trend analysis

## 🎨 Design Highlights

- Clean, modern dark theme interface
- Intuitive navigation with strategic filter placement
- Color-coded visualizations for quick insights
- Responsive layout optimized for presentations
- Professional formatting with currency and percentage displays

## 📝 Lessons Learned

- Effective data aggregation using MySQL window functions
- Power BI relationship management across multiple CSV files
- Creating dynamic measures and calculated columns in DAX
- Conditional formatting for enhanced data visualization
- Best practices for dashboard design and user experience

## 🔮 Future Enhancements

- [ ] Add profit margin analysis
- [ ] Include predictive sales forecasting
- [ ] Integrate real-time data refresh
- [ ] Add drill-through pages for detailed analysis
- [ ] Implement mobile-optimized layout
- [ ] Create automated email subscriptions for stakeholders.

## 👤 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/lukmanfthoni)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/lukmanfthoni)

## ⭐ Show Your Support

Give a ⭐️ if this project helped you learn about data analysis and visualization!

## 📧 Contact

For questions or feedback, please reach out via GitHub issues or email at your lukman.fathoni.lf@gmail.com

---

**Note**: This is an educational project created for learning purposes. The dataset is publicly available on Kaggle.
