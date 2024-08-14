select name,
       case
           when monthlymaintenance > 100 then 'expensive'
           when monthlymaintenance <= 100 then 'cheap'
       end as cost
from cd.facilities;