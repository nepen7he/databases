select cd.members.surname, cd.members.firstname, cd.members.memid, min(starttime) as starttime
from cd.bookings
full join cd.members on cd.members.memid = cd.bookings.memid
where date(starttime) >= to_date('2012-09-01', 'YYYY-MM-DD')
group by cd.members.memid
order by cd.members.memid;