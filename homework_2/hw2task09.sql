select
    concat(firstname, ' ', surname) as member,
    name as facility,
    slots * ratio as cost
from
    (select distinct
        members.memid as mem,
        *,
    case
        when members.memid = 0 then guestcost
        else membercost
    end as ratio
    from
        cd.members as members,
        cd.bookings as bookings,
        cd.facilities as facilities
    where
      date(starttime) = to_date('2012-09-14', 'YYYY-MM-DD') and
      bookings.memid = members.memid and
      bookings.facid = facilities.facid) as foo
where
    slots * ratio > 30
order by
    cost DESC, member, facility;