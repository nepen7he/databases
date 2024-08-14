select facid, extract(month from starttime) as month, sum(slots) as total_slots
from cd.bookings
where extract(year from starttime) = 2012
group by facid, extract(month from starttime)
order by facid, month;