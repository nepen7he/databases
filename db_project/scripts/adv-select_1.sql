-- 1. Вывести среднюю зарплату (при условии, что она меньше 300.000 У.Е.)
-- по всем должностям и саму должность.
select employee_position as position,
       avg(employee_salary) as average_salary
from cinema.employee
group by employee_position
having avg(employee_salary) < 300000;