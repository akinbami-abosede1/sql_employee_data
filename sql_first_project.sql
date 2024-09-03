# data clearing
SELECT * FROM project.employee;
ALTER table project.employee
DROP COLUMN employeecol;

SELECT * FROM employee
WHERE bonus=0;
DELETE FROM employee
WHERE bonus=0;


# write sql  query to retrieve all column of employee hired on the '2002-06-11'
# write sql query to find the gender and annual salary of the oldest employee 
# write sql query to find employee with  the highest and minimum salary
# write sql query to find the number of employee that have retired
# write sql query to find employee whose city start with 'shan'
# write sql  query to retrieve all column of newly admitted employee 2021
# write sql  query to retrieve month employee was hired the most
# write sql query to calculate total salary and number of employee in each department
# write sql query to find the averege age of employee who works in 'united states' and 'china' (not retired)
# write sql query to retrive employee in the derpartment of 'accounting' and annual_salary more than $200,000 in the month Dec-2021
# write sql to find total bonus made by each gender in each department
# write sql query to show the employee in the range(20-50) as young adult,range(50-70) old adult, others 'aged' (not retired)
#create a view for each department



# write sql  query to retrieve all column of employee hired on the '2002-06-11'
SELECT * FROM employee
WHERE hire_date='2002-06-11';

# write sql query to find the gender and annual salary of the oldest employee 
SELECT gender, annual_salary, max(age) FROM employee;

# write sql query to find employee with  the highest and minimum salary
SELECT ee_id, max(annual_salary) as max_salary,min(annual_salary) as min_salary
FROM employee;

# write sql query to find the number of employee that have retired
SELECT count(*) FROM employee
WHERE exit_date is null;  

# write sql query to find employee whose city start with shan
SELECT * FROM employee
WHERE city REGEXP '^shan';

# write sql  query to retrieve all column of  newly admitted employee in 2021
SELECT *, year(hire_date) as hire_year FROM employee
WHERE year(hire_date)=2021
ORDER BY hire_date DESC;

# write sql  query to retrieve the month employee was hired the most
SELECT  monthname(hire_date) as hire_month,count( monthname(hire_date)) 
 FROM employee
 GROUP BY monthname(hire_date) 
ORDER BY count( month(hire_date)) DESC
LIMIT 1;

#  write sql query to calculate total salary and number of employee in each department
SELECT DISTINCT department,
round((annual_salary * bonus), 1) as total_salary, 
count(*)  as no_employee
FROM employee
GROUP BY department;

# write sql query to find the averege age of employee who works in 'united states' and 'china' (not retired)
SELECT country, round(avg(age))
FROM employee
WHERE country IN('united states','china') AND hire_date IS NOT NULL
GROUP BY country;

# write sql query to retrive employees hired in the derpartment of 'accounting' and annual_salary more than $200,000 in the month Dec-2021
SELECT ee_id,substring(hire_date,1,7) as 'hired date', department, annual_salary
FROM employee
WHERE annual_salary>200000 and substring(hire_date,1,7)='2021-12';

# write sql to find total bonus made by each gender in each department
SELECT gender,department,round(sum(bonus),2) as sum_bonus
FROM employee
GROUP BY gender,department
ORDER BY department;

# write sql query to show the employee in the range(20-50) as young adult,range(50-70) old adult, others 'aged' (not retired)
SELECT DISTINCT age,
CASE
 WHEN age BETWEEN 20 and 50 THEN 'young adult'
 WHEN age BETWEEN 50 and 70 THEN  'old adult'
 ELSE 'aged'
 END as age_status
 FROM employee;
 
 #create a view for each department
 CREATE VIEW  ee_sales_view as
 SELECT * FROM employee
 WHERE department='sales';
 
 CREATE VIEW  ee_accounting_view as
 SELECT * FROM employee
 WHERE department='accounting';
 
 CREATE VIEW  ee_marketing_view as
 SELECT * FROM employee
 WHERE department='markerting';
 
 CREATE VIEW  ee_IT_view as
 SELECT * FROM employee
 WHERE department='IT';
 
 CREATE VIEW  ee_engineering_view as
 SELECT * FROM employee
 WHERE department='engineering';
 
 CREATE VIEW  ee_finance_view as
 SELECT * FROM employee
 WHERE department='finance';
 
 CREATE VIEW  ee_HR_view as
 SELECT * FROM employee
 WHERE department='HUMMAN RESOURCES';