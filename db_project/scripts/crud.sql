-- create <-> insert

insert into cinema.film values (11, 'Нефть', 'Пол Томас Андерсон', 158);
insert into cinema.film_x_genre values (11, 3);
insert into cinema.employee values (11, 'Глушков Владимир', 19500, 'Уборщик', '2023-01-01 00:00:00', '2100-01-01 00:00:00');
insert into cinema.genre values (15, 'Мьюзикл');
insert into cinema.session values
(11, '2024-06-23', '11:00:00', 3, 11),
(12, '2024-06-24', '11:00:00', 9, 11),
(13, '2024-06-25', '11:00:00', 2, 11);



-- read <-> select

select 
	min(ticket_cost) as minimum_price,
	max(ticket_cost) as maximum_price
from
	cinema.ticket;

select 
	count(*) as number_of_sessions_per_day
from
	cinema.session
where
	session_dt = now()::date;



-- update

update cinema.employee
set employee_salary = 23000
where employee_position = 'Уборщик';

update cinema.session
set session_dt = session_dt + interval '1 day'
where session_id = 2;



-- delete

delete from cinema.genre
where genre_nm = 'Мьюзикл';
