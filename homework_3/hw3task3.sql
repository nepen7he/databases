select
    firstname,
    surname,
    round(sum(slots) * 0.5, -1) as hours,
    rank() over (order by round(sum(slots) * 0.5, -1) DESC) as rank

from
    cd.members as members full outer join cd.bookings as bookings
    on members.memid = bookings.memid
group by members.surname, members.firstname
order by rank, surname, firstname;