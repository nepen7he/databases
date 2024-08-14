select facid, extract(month from starttime) as month, sum(slots) as slots
from cd.bookings
where extract(year from starttime) = 2012
group by facid, extract(month from starttime)

union

select facid, null as month, sum(slots) as slots
from cd.bookings
where extract(year from starttime) = 2012
group by facid

union

select null as facid, null as month, sum(slots) as slots
from cd.bookings
where extract(year from starttime) = 2012
order by facid, month;