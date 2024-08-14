select
    concat(first.firstname, ' ', first.surname) as member,
    concat(second.firstname, ' ', second.surname) as recommender
from
    cd.members as first,
    cd.members as second
where
    first.recommendedby = second.memid

union all

select
    concat(first.firstname, ' ', first.surname) as member,
    null as recommender
from
    cd.members as first,
    cd.members as second
where
    first.recommendedby is null and
    first.memid = second.memid
order by
    member,
    recommender;