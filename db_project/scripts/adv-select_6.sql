-- Отранжировать и вывести самые популярные жанры у покупателей
-- (в зависимости от количества проданных билетов на фильмы определенного жанра)
select genre_nm, count(*) as populairty, dense_rank() over (order by count(*) DESC) as rank
from cinema.ticket as t
    inner join cinema.session as s on t.session_id = s.session_id
    inner join cinema.film as f on s.film_id = f.film_id
    inner join cinema.film_x_genre as fxg on f.film_id = fxg.film_id
    inner join cinema.genre as g on fxg.genre_id = g.genre_id
group by genre_nm;