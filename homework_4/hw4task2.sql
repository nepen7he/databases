with recursive rec(memid, firstname, surname) as (
    select memid, firstname, surname
    from cd.members
    where memid = 1

    union all

    select members.memid, members.firstname, members.surname
    from cd.members as members
    join rec on members.recommendedby = rec.memid
)
select *
from rec
where memid > 1
order by memid;
