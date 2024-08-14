select upper(full_nm) as full_name
from public.coins
group by (full_nm)
order by (full_name);