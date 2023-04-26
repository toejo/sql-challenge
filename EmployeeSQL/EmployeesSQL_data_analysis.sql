-- Employee number, last name, first name, sex, and salary of each employee
select 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex,
	s.salary
from employees as e
inner join salaries as s on
	e.emp_no = s.emp_no
;

-- First name, last name, and hire date for the employees who were hired in 1986
select
	last_name, 
	first_name,
	hire_date
from employees
where hire_date >= '1986-01-01' 
	and hire_date <= '1986-12-31'
;

-- Manager of each department along with their department number, department name, employee number, last name, and first name	
select 
	d.dept_no, 
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM departments as d
INNER JOIN dept_manager as dm 
	ON d.dept_no = dm.dept_no
INNER JOIN employees as e
	ON dm.emp_no = e.emp_no
;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
INNER JOIN departments as d
	ON de.dept_no = d.dept_no
;

-- First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%'
;

-- Each employee in the Sales department, including their employee number, last name, and first name
SELECT
	d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name
FROM departments as d
INNER JOIN dept_emp as de
	ON d.dept_no = de.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales'
;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name
FROM departments as d
INNER JOIN dept_emp as de
	ON d.dept_no = de.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales'
	OR dept_name = 'Development'
;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT employees.last_name,
	COUNT (employees.last_name) as count
FROM employees
GROUP BY employees.last_name
ORDER BY employees.last_name DESC
;