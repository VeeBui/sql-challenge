-- titles
Create Table if not exists titles (
	title_id varchar(30),
	title varchar(30),
	PRIMARY KEY(title_id)
);
Select * from titles;


-- employees
Create Table if not exists employees (
	emp_no int,
	emp_title_id varchar(30),
	birthdate varchar(30),
	first_name varchar(30),
	last_name varchar(30),
	sex varchar(1),
	hire_date varchar(30),
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title_id)
		references titles(title_id)
);
Select * from employees;


-- departments
Create Table if not exists departments (
	dept_no varchar(30),
	dept_name varchar(30),
	PRIMARY KEY(dept_no)
);
Select * from departments;

-- dept_emp
Create Table if not exists dept_emp (
	emp_no int,
	dept_no varchar(30),
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no)
		references employees(emp_no),
	FOREIGN KEY(dept_no)
		references departments(dept_no)
);
Select * from dept_emp;


-- dept_manager
Create Table if not exists dept_manager (	
	dept_no varchar(30),
	emp_no int,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no)
		references employees(emp_no),
	FOREIGN KEY(dept_no)
		references departments(dept_no)
);
Select * from dept_manager;


-- salaries
Create Table if not exists salaries (
	emp_no int,
	salary int,
	PRIMARY KEY(emp_no, salary),
	FOREIGN KEY(emp_no)
		references employees(emp_no)
);
Select * from salaries;

