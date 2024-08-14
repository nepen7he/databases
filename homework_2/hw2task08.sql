select distinct concat(firstname, ' ', surname) as member, fac.name as facility
from cd.bookings as book
inner join cd.members as memb on book.memid = memb.memid
inner join cd.facilities as fac on book.facid = fac.facid
where name like 'Tennis Court %'
order by member;