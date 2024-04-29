-- 1. List the employee number, last name, first name, sex, and salary of each employee
Select * from employees;
Select * from salaries;

Select e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.sex as "Sex",
	s.salary
From employees as e
INNER JOIN salaries as s ON
	e.emp_no = s.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
Select * from employees;

Select e.first_name as "First Name",
	e.last_name as "Last Name",
	e.hire_date as "Hired Date"
From employees as e
WHERE e.hire_date LIKE '%1986';


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select * from dept_manager;
Select * from departments;
Select * from employees;

-- NOTE: "manager of each department" == "employee number, last name, and first name"
Select m.emp_no as "Manager",
	m.dept_no as "Department Number",
	d.dept_name as "Department Name",
	m.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
From dept_manager as m
INNER JOIN employees as e ON
	m.emp_no = e.emp_no
INNER JOIN departments as d ON
	m.dept_no = d.dept_no;


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select * from departments;
Select * from dept_emp;
Select * from employees;

Select de.dept_no as "Department Number",
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
From dept_emp as de
INNER JOIN employees as e ON
	de.emp_no = e.emp_no
INNER JOIN departments as d ON
	de.dept_no = d.dept_no;


-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select * from employees;

Select e.first_name as "First Name",
	e.last_name as "Last Name",
	e.sex as "Sex"
From employees as e
WHERE e.first_name = 'Hercules'
	AND e.last_name LIKE 'B%';


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
Select * from employees;
Select * from dept_emp;
Select * from departments;

Select e.emp_no as "Employee Number",
	e.first_name as "First Name",
	e.last_name as "Last Name"
From employees as e
WHERE e.emp_no IN (
	Select de.emp_no
	From dept_emp as de
	WHERE dept_no IN (
		Select d.dept_no
		From departments as d
		Where d.dept_name = 'Sales'
	)
);


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select * from employees;
Select * from dept_emp;
Select * from departments;

Select e.emp_no as "Employee Number",
	e.first_name as "First Name",
	e.last_name as "Last Name",
	d.dept_name as "Department Name"
From employees as e
INNER JOIN dept_emp as de ON
	de.emp_no = e.emp_no
INNER JOIN departments as d ON
	d.dept_no = de.dept_no
WHERE e.emp_no IN (
	Select de.emp_no
	From dept_emp as de
	WHERE dept_no IN (
		Select d.dept_no
		From departments as d
		Where d.dept_name = 'Sales'
		OR d.dept_name = 'Development'
	)
);



-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select * from employees;

Select e.last_name, count(e.last_name) as "Last Name"
From employees as e
GROUP BY e.last_name
Order By count(e.last_name) DESC;

