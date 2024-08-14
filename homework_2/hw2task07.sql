select cd.members.firstname as memfname, cd.members.surname as memsname,
				f.firstname as recfname, f.surname as recsname
from cd.members as f
full join cd.members on f.memid = cd.members.recommendedby
where cd.members.firstname is not null
order by memsname, memfname, recsname, recfname;