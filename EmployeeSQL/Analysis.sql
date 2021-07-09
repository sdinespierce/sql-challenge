-- Data Analysis Queries

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
LEFT JOIN Salaries s ON e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date LIKE '%1986'

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM Dept_Manager dm
INNER JOIN Departments d ON dm.dept_no = d.dept_no
INNER JOIN Employees e ON dm.emp_no = e.emp_no


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e
INNER JOIN (
	SELECT de.emp_no, d.dept_name
	FROM Dept_Emp de
	LEFT JOIN Departments d ON de.dept_no = d.dept_no
) d 
ON d.emp_no = e.emp_no


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, q.dept_name
FROM Employees e
RIGHT JOIN (
	SELECT emp_no, dept_name
	FROM Dept_Emp de
	LEFT JOIN Departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
) q ON e.emp_no = q.emp_no

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, q.dept_name
FROM Employees e
RIGHT JOIN (
	SELECT emp_no, dept_name
	FROM Dept_Emp de
	LEFT JOIN Departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
) q ON e.emp_no = q.emp_no


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
FROM Employees
GROUP BY last_name
ORDER BY last_name DESC


