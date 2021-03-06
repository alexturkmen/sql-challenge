-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

create view new_table as 
select first_name, last_name, hire_date, extract (year from hire_date) as year
from employees

select first_name, last_name, hire_date
from new_table
where year = 1986

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from departments as d
inner join dept_manager as dm
on d.dept_no=dm.dept_no
inner join employees as e
on dm.emp_no = e.emp_no

-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex 
from employees
where first_name='Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where de.dept_no = 'd007'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where de.dept_no in ('d005', 'd007')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc

-- 9. Creating a view for bonus activity bar chart.

create view avg_salary_by_title as
select t.title, round(avg(s.salary),2)
from salaries as s
inner join employees as e 
on s.emp_no=e.emp_no
inner join titles as t
on e.emp_title_id=t.title_id
group by t.title



