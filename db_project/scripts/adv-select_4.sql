-- Отранжировать фильмы в зависимости от выручки по каждому отдельному дню
select distinct session_dt as date, film_nm as film, sum as revenue, 
                dense_rank() over (partition by session_dt order by sum DESC) as rank
from (select session_dt, film_nm, ticket_cost, sum(ticket_cost) over (partition by film_nm) as sum
from cinema.session as s
    inner join cinema.ticket as t on s.session_id = t.session_id
    inner join cinema.film as f on f.film_id = s.film_id) as sub
order by session_dt;
