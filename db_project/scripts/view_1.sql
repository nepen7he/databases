-- Данное представление позволяет провести анализ данных сотрудников (id скрыто)
create or replace view cinema.employee_analysis as
select employee_nm, employee_salary as salary, employee_position as position,
       employee_settled as settled_date, employee_retired as retired_date
from cinema.employee;