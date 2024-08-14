-- Данное представление позволяет получить информацию о занятости местах в кинотеатре,
-- причем если место занято, будет выведена полная информация по этому месту
create or replace view cinema.places as
select
    case
        when ticket_id is null then 'Free'
        else 'Occupied'
    end as is_free,
    place.place_id, number_of_row, number_of_sit, place.hall_id,
    session_dt as date,
    session_tm as time,
    hall_nm as hall
from cinema.place as place
    full outer join cinema.ticket as ticket on place.place_id = ticket.ticket_id
    left join cinema.session as session on ticket.session_id = session.session_id
    full outer join cinema.hall as hall on hall.hall_id = session.hall_id;