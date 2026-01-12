-- Sales Per Dealer Region
Select Dealer_Region, sum(price) from cars
group by Dealer_Region;

-- Sales Per Color
Select Color, sum(price) from cars
group by Color;

-- Sales Per Company (car brands)
Select Company, sum(price) from cars
group by Company;

-- Sales Per Transmission
Select Transmission, sum(price) from cars
group by Transmission;

-- Sales Per Engine Type
Select Engine, sum(price) from cars
group by Engine;

-- Sales by Dealer
Select Dealer, sum(price) from cars
group by Dealer;

-- Sales Per Gender
Select Gender, sum(price) from cars
group by Gender;

-- Gender fav Car Color
SELECT 
    Color,
    Gender,
    COUNT(*) as carsold
FROM cars
GROUP BY Color, Gender
ORDER BY Color, Gender;

--  Fav Cars Body Styke Per Gender
SELECT 
    Body_style,
    Gender,
    COUNT(*) as Fav_cars
FROM cars
GROUP BY Body_style, Gender
ORDER BY Body_style, Gender;

-- YTD total Sales
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

-- Car Sold per Dealer
Select Dealer, count(id) from cars
group by Dealer;

-- Total Sales per Body Style
Select Body_style, sum(price) from cars
group by Body_style;

-- Sales And Revenue YTD
SELECT 
    COUNT(*) as Sales_YTD,
    SUM(Price) as Revenue_YTD,
    AVG(Price) as Avg_Price
FROM cars
WHERE YEAR(Date) = 2020;

-- Weekly Trend
SELECT 
    YEAR(Date) as Year,
    WEEK(Date) as Week,
    DATE_FORMAT(Date, '%Y-W%u') as Week_Label,
    COUNT(*) as Total_Sales,
    SUM(Price) as Total_Revenue
FROM cars
WHERE YEAR(Date) in (2020, 2021)
GROUP BY YEAR(Date), WEEK(Date), DATE_FORMAT(Date, '%Y-W%u')
ORDER BY Year, Week;

-- Cars Avg price
SELECT ROUND(AVG(Price), 2) as YTD_Avg_Price
FROM cars
WHERE Date BETWEEN '2020-02-01' AND '2021-12-31';

-- 