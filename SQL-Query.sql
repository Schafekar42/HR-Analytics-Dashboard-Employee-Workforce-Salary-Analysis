 use HR_db

 SELECT * FROM INFORMATION_SCHEMA.TABLES;

 select * from HRData

/* Total Head count */
select Count(*) as head_count from HRData

/* Active Employees */
select YEAR(HiringDate) as year, count(*) as Active_emp from HRData 
where EmploymentStatus = 'Active'
group by YEAR(HiringDate)
order by  year;

/* Active % employee */
select YEAR(Hiringdate) as year,
	ROUND(
		(count(case when EmploymentStatus = 'Active' then 1 end) * 100) / count(*),2) as Active_percentage 
	
From HRData
group by YEAR(hiringdate)
order by year 

/* Terminated employee */

select YEAR(HiringDate) as year, count(*) as Terminated_emp from HRData
where EmploymentStatus != 'Active'
group by YEAR(Hiringdate)
order by Year;

/* Terminated % */

select Year(Hiringdate) as year,
		Round((count(case when EmploymentStatus != 'Active' then 1 end) * 100) / count(*),2) as Terminated_percentage

from HRData
group by Year(Hiringdate)
order by year 

/* Male employee */
select year(Hiringdate) as year, count(*) as male_count from HRData
where Gender = 'M'
group by year(hiringdate)
order by year;

/* Male employee % */

Select year(hiringdate) as year,
		Round((count(case when Gender = 'M' then 1 end) * 100) / count(*),2) as Male_percent

from HRData
group by year(hiringdate)
order by year

/* Female Employee Count */
select year(hiringdate) as year, count(*) as female_emp from HRData
where Gender = 'F'
group by year(hiringdate)
order by year

/* Female Employee % */
select Year(hiringdate) as year,
		round((count(case when Gender = 'F' then 1 end)* 100)/ count(*),2) as female_percent
from HRData
group by year(hiringdate)
order by year

/* Total Employee Salary */
select year(hiringdate) as year, Sum(salary) as total_Salary from HRData
group by year(hiringdate)
order by year

/* Salary as per the department */

select year(hiringdate) as year, department, sum(salary) as total_salary from HRData
group by year(hiringdate),Department
order by year

/* Maritial Status */
select year(hiringdate) as year, 
		round((count(case when MaritalStatus = 'Married' then 1 end) * 100)/ count(*),2) as Married_emp,
		round((count(case when MaritalStatus = 'Single' then 1 end)* 100)/count(*),2) as single,
		round((count(case when MaritalStatus = 'Divorced' then 1 end)* 100)/count(*),2) as divorced,
		round((count(case when MaritalStatus =  'Widowed' then 1 end) * 100)/count(*),2) as windowed
from HRData
group by year(hiringdate)
order by year

/* Employee by department */
select Year(hiringdate) as year,department, Count(*) as total_emp from HRData
group by year(hiringdate), department
order by year,Department

/* Employee performanc)e Analysis */
select Year(hiringdate) as year ,PerformanceScore, count(*) as performance_count from HRData
group by year(hiringdate),PerformanceScore
order by year

/* Recruitment Source Analysis */
select year(hiringdate) as year, RecruitmentSource, count(*) as no_of_recruitment from HRData
group by year(hiringdate), recruitmentSource
order by year

/* Employee Satisfaction Analysis */

select year(hiringdate) as year,
			case 
				   when EmployeeSatisfaction = 5 then 'very high'
				   when EmployeeSatisfaction = 4 then ' high'
				   when EmployeeSatisfaction = 3 then 'Acceptable'
				   when EmployeeSatisfaction = 2 then 'Low'
				   when EmployeeSatisfaction = 1 then 'very Low'
			end as satisfaction_level, 
count(*) as total_emp_score 
from HRData
group by year(hiringdate), EmployeeSatisfaction
order by year

/* State wise department */

select  year(hiringdate) as year,State , count(*) as department_count_against_state from HRData
group by  year(hiringdate),State
order by  year,department_count_against_state

