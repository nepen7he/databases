select
    name,
    rank
from
    (select
        name,
        dense_rank() over (order by sum(summary) DESC) as rank
    from
        (select name,
                case
                    when bookings.memid = 0 then slots * guestcost
                    else slots * membercost
                end as summary
        from cd.facilities as facilities inner join cd.bookings as bookings on facilities.facid = bookings.facid) as f
    group by name
    order by name) as q
where rank <= 3;