-- Вывести все фильмы, доступные в кинотеатре, 
-- упорядоченные по длительности
select film_nm, duration_min
from cinema.film
order by duration_min DESC;