select distinct f.firstname, f.surname
from cd.members as f
full join cd.members on f.memid = cd.members.recommendedby
where members.recommendedby is not null
order by f.surname, f.firstname;