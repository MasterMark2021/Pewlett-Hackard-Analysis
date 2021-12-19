---------Deliverable 1 as requested
-- Retrieving the number of Retiring Employees by Title
SELECT A.emp_no,
	A.first_name,
	A.last_name,
	B.title,
	B.from_date,
	B.to_date
INTO Retirement_titles
FROM employees AS A
LEFT JOIN titles AS B
ON A.emp_no = B.emp_no
WHERE (A.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY B.emp_no;
	

-- Using Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retrieving the  number of employees by most recent job title that are about to retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

Deliverable 2 as Requested 

-- Deliverable 2 Michael Mishkanian
-- create table of employees eligible for mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
