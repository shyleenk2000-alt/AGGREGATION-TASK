--SECTION 1 – COUNT Aggregations (10 Questions)

--1. How many total properties are in the database?

SELECT COUNT(*) AS Total_Properties from dbo.property24

--2. How many properties are listed in each province?

SELECT (PROVINCE),
COUNT (PROVINCE) AS No_of_Properties
FROM dbo.property24
GROUP BY [PROVINCE]

--3. How many properties are listed in each city?

SELECT (CITY),
COUNT (PROVINCE) AS No_of_Prperties
FROM dbo.property24
GROUP BY [CITY]

--4. How many properties have more than 2 bedrooms?

SELECT COUNT (*) AS No_of_Properties_with_3plus_BEDROOMS
FROM dbo.property24 where BEDROOMS>2

--5. How many properties have 2 or more bathrooms?

SELECT COUNT (*) AS No_of_Properties_with_2plus_BATHROOMS
FROM dbo.property24 where BATHROOMS>=2

--6. How many properties have parking for at least 2 cars?

SELECT COUNT (*) AS No_of_Prperties_with_2plus_PARKING
FROM dbo.property24 where PARKING>=2

--7. How many properties are priced above R3,000,000?

SELECT COUNT (*) AS No_of_Prperties
FROM dbo.property24 where PROPERTY_PRICE>300000

--8. How many properties are in Gauteng?

SELECT COUNT (*) AS No_of_Properties
FROM dbo.property24
WHERE PROVINCE = 'Gauteng'

--9. How many properties per province have floor size greater than 200?

SELECT (PROVINCE),
COUNT (PROVINCE) AS No_of_Properties
FROM dbo.property24
Where FLOOR_SIZE>200

--10. How many distinct provinces are in the table?

SELECT COUNT(DISTINCT PROVINCE) FROM dbo.property24

--SECTION 2 – SUM Aggregations (10 Questions)
--11. What is the total value of all properties combined?

SELECT SUM(CAST(PROPERTY_PRICE AS BIGINT))
FROM dbo.property24

--12. What is the total property value per province?

SELECT (PROVINCE),
SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS total_property_value
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY total_property_value

--13. What is the total property value per city?

SELECT (CITY),
SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS total_property_value
FROM dbo.property24
GROUP BY CITY
ORDER BY total_property_value

--14. What is the total monthly repayment for all properties?

SELECT SUM(CAST(Monthly_Repayment AS BIGINT))
FROM dbo.property24



--15. What is the total monthly repayment per province?

SELECT (PROVINCE),
SUM(CAST(Monthly_Repayment as bigint))
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY total_repayment

--16. What is the total once-off cost for all properties?

SELECT SUM(CAST(Total_Once_off_Costs as bigint))
FROM dbo.property24

--17. What is the total once-off cost per province?

SELECT (PROVINCE),
SUM(CAST(Total_Once_off_Costs as bigint))
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY Total_Once_off_Cost

--18. What is the total property value for Gauteng?
SELECT (PROVINCE),
SUM(CAST(PROPERTY_PRICE AS BIGINT))
FROM dbo.property24
 WHERE (PROVINCE='Gauteng')

--19. What is the total property value for properties priced above R4,000,000?

SELECT SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS total_prperty_value
FROM dbo.property24
WHERE PROPERTY_PRICE>4000000

--20. What is the total minimum gross monthly income required per province?

SELECT (PROVINCE),
SUM(Min_Gross_Monthly_Income) as total_minimum_gross
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY total_minimum_gross

--SECTION 3 – AVG Aggregations (10 Questions)

--21. What is the average property price overall?

SELECT AVG(CAST(PROPERTY_PRICE AS BIGINT))
FROM dbo.property24

--22. What is the average property price per province?

SELECT (PROVINCE),
AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS average_price
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY average_price

--23. What is the average property price per city?

SELECT (CITY),
AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS average_price
FROM dbo.property24
GROUP BY CITY
ORDER BY average_price

--24. What is the average number of bedrooms per province?

SELECT (PROVINCE),
AVG(CAST(BEDROOMS AS DECIMAL)) AS Average_No_of_Bedrooms
FROM dbo.property24
GROUP BY PROVINCE 
ORDER BY Average_No_of_Bedrooms

--25. What is the average number of bathrooms per province?

SELECT (PROVINCE),
AVG(CAST(BATHROOMS AS DECIMAL)) AS Average_No_Of_Bathrooms
FROM dbo.property24
group by PROVINCE

--26. What is the average floor size per province?

SELECT (PROVINCE),
AVG(CAST(FLOOR_SIZE AS DECIMAL)) AS Average_Floor_Size
FROM dbo.property24
GROUP BY PROVINCE

--27. What is the average monthly repayment per province?

SELECT (PROVINCE),
AVG(Monthly_Repayment) as Average_Monthly_Repayment
FROM dbo.property24
GROUP BY PROVINCE

--28. What is the average once-off cost per province?

SELECT (PROVINCE),
AVG(CAST(Total_Once_off_Costs AS BIGINT)) as AverageOnceOffCost
FROM dbo.property24
Group by PROVINCE

--29. What is the average minimum gross monthly income per province?

SELECT (PROVINCE),
AVG(Min_Gross_Monthly_Income) as MinGrossMonIncome
FROM dbo.property24
GROUP BY PROVINCE
--30. What is the average property price for properties above R3,000,000?

SELECT AVG(CAST(PROPERTY_PRICE AS BIGINT))
FROM dbo.property24
WHERE PROPERTY_PRICE>3000000

--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?

SELECT TOP 1 (PROVINCE),
AVG(Cast(PROPERTY_PRICE as bigint)) as Highest_Average_Property_Price
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY Highest_Average_Property_Price desc;

--32. Which province has the lowest average property price?

SELECT TOP 1 (PROVINCE),
AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS Lowest_Average_Property_Price
FROM dbo.property24
GROUP BY PROVINCE
ORDER BY Lowest_Average_Property_Price asc;

--33. Which city has the highest total property value?

SELECT TOP 1 (CITY),
SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS Highest_Total_Property_Price
FROM dbo.property24
GROUP BY CITY
ORDER BY Highest_Total_Property_Price desc;

--34. Which city has the lowest average property price?
SELECT TOP 1 (CITY),
AVG(CAST(PROPERTY_PRICE as bigint)) as Average_Lowest_Property_Price
FROM dbo.property24
GROUP BY CITY
ORDER BY Average_Lowest_Property_Price ASC;

--35. How many properties per province are priced above R2,000,000?

SELECT (PROVINCE),
COUNT(PROVINCE) AS No_of_Properties
FROM dbo.property24
WHERE PROPERTY_PRICE>2000000

--36. What is the average floor size per province for properties above R3,000,000?

SELECT (PROVINCE),
AVG(CAST(FLOOR_SIZE AS DECIMAL)) AS AVERAGE_FLOOR_SIZE
FROM dbo.property24
WHERE PROPERTY_PRICE>3000000
GROUP BY PROVINCE

--37. What is the total property value per province for properties with 3 or more bedrooms?

SELECT (PROVINCE),
SUM(CAST(PROPERTY_PRICE AS BIGINT))
FROM dbo.property24
WHERE BEDROOMS>=3
GROUP BY PROVINCE

--38. What is the average monthly repayment per province for properties above R4,000,000?

SELECT (PROVINCE),
AVG(CAST(Monthly_Repayment as bigint))
FROM dbo.property24
Where PROPERTY_PRICE>4000000
GROUP BY PROVINCE

--39. How many properties per city have parking for 2 or more cars?

SELECT COUNT (CITY)
FROM dbo.property24
WHERE PARKING>=2


--40. What is the average minimum gross monthly income per province for properties above R5,000,000?

SELECT (PROVINCE),
AVG(Min_Gross_Monthly_Income)
FROM dbo.property24
WHERE PROPERTY_PRICE>5000000
GROUP BY PROVINCE
