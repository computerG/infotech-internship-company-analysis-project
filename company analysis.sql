create table employees (
emp_no Int,
birth_date DATE,
first_name VARCHAR(14),
last_name VARCHAR(16),
gender VARCHAR (1),
hire_date DATE,
PRIMARY KEY (emp_no))
;

create table titles (
	emp_no int,
	title VARCHAR (50),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(emp_no) references employees(emp_no)
	);
create table if not exists salaries 
(
	emp_no int,
	salary int,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) references employees(emp_no)
);
create table departments
(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(40)
);
create table dept_emp
(
	emp_no INT PRIMARY KEY,
	dept_no VARCHAR(4),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no)
)
;
create table dept_manager
(
	dept_no VARCHAR(4) primary key,
	emp_no INT ,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no)
);
--1Retrieve the first name and last name of all employees
select first_name, last_name from employees;
--2 Find the department numbers and names.
select * from departments;
--3 Get the total number of employees.
select count (*) as total_employees from employees;
--4 Find the average salary of all employees
select round(avg(salary),2) as average_salary from salaries;
;
--5 Retrieve the birth date and hire date of employee with emp_no 10003
select birth_date, hire_date from employees
where emp_no = 10003;
--6 Find the titles of all employees
select title from titles;
--7 Get the total number of departments.
select count (*) from departments;
--8 Retrieve the department number and name where employee with emp_no 10004 works
select dept_no, dept_name from dept_emp 
join departments deprt using(dept_no)
where emp_no = 10004;

--9 Find the gender of employee with emp_no 10007
select gender from employees where emp_no = 10007;
--10 Get the highest salary among all employees.
select max(salary) as highest_salary from salaries;
--alternative
select salary as highest_salary from salaries
order by salary desc limit 1;
--11 Retrieve the names of all managers along with their department names.
select dept_name , first_name ||' '|| last_name from dept_manager
join departments using (dept_no)
join employees using (emp_no);
--12 Find the department with the highest number of employees.
with cte as (
select dept_no, count (emp_no)as total_emp from dept_emp
group by dept_no
	)
	select dept_no, total_emp from cte
	group by dept_no,total_emp 
	order by total_emp desc
	limit 1
	;
	
--select * from salaries;
--select * from employees;
--13 Retrieve the employee number, first name, last name, and salary of employees earning more
--than $60,000.
select emp_no, first_name, last_name,salary
from salaries join employees using (emp_no)
where salary >60000;
--14 Get the average salary for each department.
select dept_no, round(avg(salary),2)
from salaries 
join dept_emp using (emp_no)
group by dept_no;
/*--15 Retrieve the employee number, first name, last name, and title of all employees who are
currently managers.*/
select emp_no,first_name, last_name, title 
from dept_manager 
join titles using (emp_no)
join employees using (emp_no);
--16 Find the total number of employees in each department
select dept_no, count (emp_no)as total_emp
from dept_emp
group by dept_no 
order by total_emp desc ;
;
--17 Retrieve the department number and name where the most recently hired employee works
with cte as (
select emp_no, hire_date 
from employees
order by hire_date desc limit 1)
select dept_no, dept_name 
from cte join dept_emp using (emp_no)
join departments using(dept_no);
/*--18 Get the department number, name, and average salary for departments with more than 3
employees */
with cte as(
select dept_no, round(avg(salary),2) as avg_salary
from salaries left 
join dept_emp using (emp_no) 
group by dept_no
having count (emp_no) >3
	)
select dept_no, dept_name, avg_salary 
from cte join departments using (dept_no)
;
-- 19 Retrieve the employee number, first name, last name, and title of all employees hired in 2005
select emp_no, first_name, last_name, title, hire_date 
from employees join titles using (emp_no)
where extract (year from hire_date) = 2005;
--20 Find the department with the highest average salary.
with cte as(
select dept_no, round(avg(salary),2) as avg_salary
from salaries left 
join dept_emp using (emp_no) 
group by dept_no)
select dept_no, dept_name, avg_salary 
from cte 
join departments using (dept_no)
order by avg_salary desc
limit 1
;
/*--21 Retrieve the employee number, first name, last name, and salary of employees hired before the
year 2005.*/
select emp_no, first_name, last_name, title, hire_date 
from employees join titles using (emp_no)
where extract (year from hire_date) < 2005;
/*--no 22 Review Get the department number, name, and total number of employees for departments with a
female manager.*/
with cte as 
	(select dept_no, count(*)
	 from dept_emp
	 group by dept_no
	)

select dept_no,dept_name from dept_manager
	join employees using(emp_no)
	JOIN departments  using (dept_no)
	join cte using (dept_no)
	where gender = 'F'
;
/*--no 23 Retrieve the employee number, first name, last name, and department name of employees who
are currently working in the Finance department.*/
select emp_no,first_name,last_name, dept_name
from employees join dept_emp using(emp_no)
join departments using (dept_no)
where dept_name = 'Finance'
--24 Find the employee with the highest salary in each department.
with cte as (select emp_no, dept_no,salary,
DENSE_RANK() OVER (PARTITION BY dept_no ORDER BY salary DESC) AS SaloRank
			 from salaries
join dept_emp using (emp_no))
select  emp_no,first_name,last_name dept_no,salary,SaloRank 
from cte
join employees using (emp_no)
where SaloRank = 1;
/*--25 Retrieve the employee number, first name, last name, and department name of employees who
have held a managerial position.*/
select emp_no ,dept_name,first_name,last_name,title from titles
join employees using (emp_no)
join dept_emp using (emp_no)
join departments using (dept_no)
where title = 'Manager' or title LIKE '%Manager';
--26 Get the total number of employees who have held the title "Senior Manager."
select count (*) as senior_manager 
from titles where title ='Senior Manager';
/*--27 Retrieve the department number, name, and the number of employees who have worked there
for more than 5 years.*/
select emp_no, first_name, last_name, DATE_PART('YEAR',AGE(CURRENT_DATE,hire_date) )as years
from employees 
where DATE_PART('YEAR',AGE(CURRENT_DATE,hire_date) )>5
Order by years desc
; 
--28 Find the employee with the longest tenure in the company
select emp_no, first_name, last_name, AGE(CURRENT_DATE,hire_date) as age
from employees 
Order by age desc
limit 1; 

/*--29 Retrieve the employee number, first name, last name, and title of employees whose hire date is
between '2005-01-01' and '2006-01-01'.*/
select emp_no, first_name, last_name ,title
from employees join titles using(emp_no)
where hire_date between '2005-01-01' and '2006-01-01'
;
--30  Get the department number, name, and the oldest employee's birth date for each department

with cte as (select emp_no,dept.dept_no,dept.dept_name, birth_date,
	DENSE_RANK() OVER (PARTITION BY dept.dept_no ORDER BY birth_date DESC) AS age_rank
				 from employees
	join dept_emp de using (emp_no)
	join departments dept on dept.dept_no  = de.dept_no)
	select  dept_no,dept_name,age_rank ,ct.birth_date
from cte ct
join employees using (emp_no)
where age_rank = 1;



