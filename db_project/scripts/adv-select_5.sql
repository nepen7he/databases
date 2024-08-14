-- По каждому дню вывести информацию по первому и последнему сеансу (транслирующийся фильм, название зала, время)
select distinct session_dt as date,
                first_value(session_tm) over (partition by session_dt) as first_session_time,
                first_session_film, first_session_hall,
                last_value(session_tm) over (partition by session_dt) as last_session_time,
                last_session_film, last_session_hall
from (select distinct session_dt, session_tm, film_nm,
                      first_value(hall_nm) over (partition by session_dt order by session_tm) as first_session_hall,
                      last_value(hall_nm) over (partition by session_dt order by session_tm) as last_session_hall,
                      first_value(film_nm) over (partition by session_dt) as first_session_film,
                      last_value(film_nm) over (partition by session_dt) as last_session_film
    from cinema.session as s
        inner join cinema.hall as h on s.hall_id = h.hall_id
        inner join cinema.film as f on f.film_id = s.film_id) as sub
order by session_dt;