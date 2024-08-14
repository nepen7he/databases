-- Данное представление позволяет получить дополнительную информацию о залах в кинотеатре,
-- включающую в себя id, название, количество сессий (в том числе и общее), выручку (в том числе и общую)
create or replace view cinema.halls_info as
select hall.hall_id, hall_nm as hall_name, count(ticket.session_id) as count_of_sessions,
       sum(ticket_cost) as revenue_for_hall
from cinema.hall as hall
    inner join cinema.session as session on hall.hall_id = session.hall_id
    inner join cinema.ticket as ticket on session.session_id = ticket.ticket_id
group by hall_nm, hall.hall_id

union all

select 0 as id, 'all halls' as halls, count(*) as overall_sessions, sum(ticket_cost)
from cinema.hall as hall
    inner join cinema.session as session on hall.hall_id = session.hall_id
    inner join cinema.ticket as ticket on session.session_id = ticket.ticket_id
order by hall_id;