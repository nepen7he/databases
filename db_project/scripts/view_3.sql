-- Данное представление позволяет получить информацию обо всех сеансах и транслирующихся на них фильмах
create or replace view cinema.films_and_sessions as
select session_id as session, session_dt as date, session_tm as time, film_nm as film, hall_nm as hall
from cinema.film as film
    inner join cinema.session as session on film.film_id = session.film_id
    inner join cinema.hall as hall on session.hall_id = hall.hall_id;
    