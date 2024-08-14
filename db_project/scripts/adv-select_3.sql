-- Вывести все фильмы, отранжированные по количеству сеансов
select film_nm, dense_rank() over (order by count(film_nm) DESC)
from cinema.session as s inner join cinema.film as f on s.film_id = f.film_id
group by film_nm;