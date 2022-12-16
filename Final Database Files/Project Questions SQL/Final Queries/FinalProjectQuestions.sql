-- Project Questions  

------Steve------- 

-- What projects were finished before the deadline in 2022? 
SELECT date_part('year', billed_date) as year, 
	deadline, billed_date, u.full_name as consultant, 
	project_id, p.account_id, project_name, billed_amount
FROM projects p
JOIN users as u
ON p.user_id = u.user_id
WHERE billed_date < deadline
AND date_part('year', billed_date) = 2022
GROUP BY year, deadline, billed_date, u.full_name, p.account_id, project_id, project_name, billed_amount 
ORDER BY 1, 8 DESC;


-- What percentage of projects were finished before the deadline? 
WITH numerator as ( 
SELECT COUNT(project_id) as projects_finished_early 
FROM projects 
WHERE billed_date < deadline 
ORDER BY projects_finished_early 
), 
denominator as ( 
SELECT COUNT(project_id) as total_projects 
FROM projects 
WHERE billed_date IS NOT NULL 
ORDER BY total_projects
) 
SELECT *, 
(SELECT total_projects FROM denominator),
100 * projects_finished_early / (SELECT total_projects FROM denominator) AS percentage_finished_early 
FROM numerator; 

-- What percentage of projects were finished by the deadline? 
WITH numerator as ( 
SELECT COUNT(project_id) as projects_finished_ontime 
FROM projects 
WHERE billed_date = (deadline + 1)
ORDER BY projects_finished_ontime 
), 
denominator as ( 
SELECT COUNT(project_id) as total_projects 
FROM projects 
WHERE billed_date IS NOT NULL 
ORDER BY total_projects
) 
SELECT *, 
(SELECT total_projects FROM denominator),
100 * projects_finished_ontime / (SELECT total_projects FROM denominator) AS percentage_finished_ontime 
FROM numerator; 

-- What percentage of projects were finished after the deadline?
WITH numerator as ( 
SELECT COUNT(project_id) as projects_finished_late 
FROM projects 
WHERE billed_date > (deadline + 1)
ORDER BY projects_finished_late 
), 
denominator as ( 
SELECT COUNT(project_id) as total_projects 
FROM projects 
WHERE billed_date IS NOT NULL 
ORDER BY total_projects
) 
SELECT *, 
(SELECT total_projects FROM denominator),
100 * projects_finished_late / (SELECT total_projects FROM denominator) AS percentage_finished_late 
FROM numerator; 


-- What is the total wage gap (compensation gap) between male and female employees? 
WITH male as ( 
SELECT SUM(salary) as male_salary 
FROM users 
WHERE sex = 'male' 
ORDER BY male_salary 
), 
female as ( 
SELECT SUM(salary) as female_salary 
FROM users 
WHERE sex = 'female' 
ORDER BY female_salary 
) 
SELECT *, 
	(SELECT female_salary FROM female), 
	male_salary - (SELECT female_salary FROM female) AS wage_gap 
FROM male; 

-- What is the average wage gap between male and female employees
WITH male as ( 
SELECT AVG(salary) as male_salary 
FROM users 
WHERE sex = 'male' 
ORDER BY male_salary 
), 
female as ( 
SELECT AVG(salary) as female_salary 
FROM users 
WHERE sex = 'female' 
ORDER BY female_salary 
) 
SELECT *, 
	(SELECT female_salary FROM female), 
	male_salary - (SELECT female_salary FROM female) AS avg_wage_gap 
FROM male; 

-- Which account manager brought in the most revenue? 
SELECT a.account_manager, u.full_name, 
	SUM(paid_amount) AS project_expense
FROM projects as p 
JOIN accounts as a  
ON p.account_id = a.account_id 
JOIN users as u 
ON a.account_manager = u.user_id
GROUP BY a.account_manager, u.full_name
HAVING SUM(paid_amount) > 0
ORDER BY 3 DESC; 


------------- Noah ------------- 

-- How much did Devkings make in profit in 2022?  
SELECT date_part('year', p.paid_date) AS year, SUM(p.paid_amount) AS revenue, SUM(u.salary) AS expenses,
	SUM(p.paid_amount) - SUM(u.salary) AS profit 
FROM projects p 
JOIN users u 
ON p.user_id = u.user_id 
WHERE date_part('year', p.paid_date) = '2022'
GROUP BY year; 



-- Which office generates the most revenue? 
SELECT p.office_id, o.office_name, SUM(p.paid_amount) AS total_revenue 
FROM projects p 
JOIN offices o 
ON p.office_id = o.office_id 
GROUP BY o.office_name, p.office_id 
ORDER BY 3 DESC; 


-- Which consultant had the most projects, revenue and profit? 
SELECT u.full_name, COUNT(p.project_id) AS total_projects,  
	SUM(p.paid_amount) AS total_revenue,  
	SUM(p.paid_amount) - u.salary AS profit 
FROM projects p  
JOIN users u 
ON p.user_id = u.user_id 
GROUP BY u.full_name, u.salary 
ORDER BY 2 DESC, 3 DESC; 


-- Who are our top 5 accounts by expense? 
SELECT RANK() OVER(ORDER BY SUM(p.billed_amount) DESC) AS ranking, 
	a.account_name, 
	SUM(p.billed_amount) AS expense 
FROM projects p 
JOIN accounts a 
ON p.account_id = a.account_id 
GROUP BY account_name 
HAVING SUM(billed_amount) > 0 
LIMIT 5; 

--------- Nate ---------

-- What was the outstanding balance by year? 
-- And, by what amount for each? 
-- SELECT date_part('year', paid_date) AS year,  
-- 	paid_amount, 
-- 	billed_amount 
-- FROM projects 
-- where paid_amount < billed_amount 
-- and date_part('year', paid_date) is not null;
 

-- SELECT date_part('year', paid_date) AS year,  
-- 	sum(paid_amount) as paid, 
-- 	sum(billed_amount) as billed 
-- FROM projects 
-- where paid_amount < billed_amount 
-- and date_part('year', paid_date) is not null 
-- group by year;

-- SELECT date_part('year', paid_date) AS year,
-- 	sum(billed_amount - paid_amount) as outstanding_balance
-- FROM projects
-- where paid_amount < billed_amount
-- 	and date_part('year', paid_date) is not null
-- group by year;


-- What was the outstanding balance by year? 
SELECT date_part('year', paid_date) AS year,
	sum(paid_amount - billed_amount) as outstanding_balance 
FROM projects
where paid_amount < billed_amount
	and date_part('year', paid_date) is not null
group by year
order by year;

-- What is the Outstranding Balance by account? 
SELECT RANK() OVER(ORDER BY SUM(p.paid_amount) DESC) AS ranking,   
	a.account_name,  
	SUM(p.paid_amount - p.billed_amount) AS outstanding   
FROM projects p   
JOIN accounts a   
ON p.account_id = a.account_id  
where paid_amount < billed_amount 
GROUP BY account_name
ORDER BY 3
LIMIT 5; 


-- How many employees had a salary higher than the average (across all years and departments)
SELECT COUNT(*) as employees_salary_higher_than_avg, AVG(salary) as avg_Devkings_salary
FROM users 
WHERE salary > ( 
	SELECT AVG(salary) avg_salary
FROM users);

-- How much revenue did the company generate in 2019, 2020, 2021 and 2022?
SELECT date_part('year', paid_date) AS year, sum(paid_amount) revenue
FROM projects
WHERE date_part('year', paid_date) is not null 
GROUP BY 1
ORDER BY 1; 