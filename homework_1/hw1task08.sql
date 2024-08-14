select upper(full_nm) as full_name, dt, high_price as price
from
    (select rank() over (partition by full_nm order by high_price DESC, dt) as rank, full_nm, dt, high_price
     from public.coins) as f
where rank = 1
order by price DESC, full_name;