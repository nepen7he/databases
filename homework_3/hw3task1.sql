select
    rank, dt, sum as vol
from
    (select
        rank() over (order by sum(vol) DESC) as rank,
        sum(vol) as sum,
        dt
    from coins
    group by dt) as sub
where sub.rank <= 10;