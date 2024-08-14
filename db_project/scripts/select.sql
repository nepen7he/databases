-- В результате данного select-запроса будут получены зарплаты для всех должностей по убыванию.
select
    avg(employee_salary) as average_salary, employee_position as position
from cinema.employee
group by employee_position
order by average_salary DESC;

-- 
select
    