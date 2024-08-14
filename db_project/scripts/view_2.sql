-- Данное представление позволяет провести анализ данных сотрудников, имена которых заменены на инициалы
create or replace view cinema.employee_ticket_analysis as
select concat(left(employee_nm, 1), '. ', substr(employee_nm, position(' ' IN employee_nm) + 1, 1), '.') as initials,
       employee_salary as salary, employee_position as position,
       employee_settled as settled_date, employee_retired as retired_date,
       count(ticket_cost) as ticket_sold, sum(ticket_cost) as ticket_sold_in_rubles
from cinema.employee as emp right join cinema.ticket as tick on emp.employee_id = tick.employee_id
group by emp.employee_id;
