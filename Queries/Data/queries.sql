SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';



-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

Drop Table retirement_info

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
    retirement_info.last_name,
    dept_emp.to_date
	from retirement_info left join dept_emp
	on retirement_info.emp_no = dept_emp.emp_no;

    -- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT a.emp_no,
    a.first_name,
    a.last_name,
    b.to_date
	from retirement_info as a  left join dept_emp as b 
	on a.emp_no = b.emp_no;
	
	
	SELECT a.emp_no,
    a.first_name,
    a.last_name,
b.to_date
INTO current_emp
FROM retirement_info as a
LEFT JOIN dept_emp as b
ON a.emp_no = b.emp_no
WHERE b.to_date = ('9999-01-01');

select * from current_emp

-- Employee count by department number
SELECT COUNT(c.emp_no), d.dept_no
FROM current_emp as c
LEFT JOIN dept_emp as d
ON c.emp_no = d.emp_no
GROUP BY d.dept_no
Order by d.dept_no;


select a.first_name, 
a.last_name,a.gender, b.salary
INTO Employee_Information
From employees as a left join salaries as b  
ON a.emp_no = b.emp_no
WHERE (a.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (a.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY b.salary;


---List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
	