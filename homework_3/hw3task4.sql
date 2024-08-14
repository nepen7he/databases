select
    name, 
    case
        when ntile(3) over (order by sum(sum)) = 3 then 'high'
        when ntile(3) over (order by sum(sum)) = 2 then 'average'
        else 'low'
        end as revenue

from (select slots,
    name, 
    case
        when bookings.memid = 0 then slots * guestcost
        else slots * membercost
    end as sum
from cd.facilities as facilities inner join cd.bookings as bookings on facilities.facid = bookings.facid) as q
group by name
order by ntile(3) over (order by sum(sum)) DESC, name;