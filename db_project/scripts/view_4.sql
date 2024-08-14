-- Данное представление позволяет получить полную информацию о транслирующихся в кинотеатре фильмах
create or replace view cinema.films_info as
select film_nm as film, director, duration_min, genre_nm as genre
from cinema.film as film
    inner join cinema.film_x_genre as fxg on film.film_id = fxg.film_id
    inner join cinema.genre as genre on fxg.genre_id = genre.genre_id;
