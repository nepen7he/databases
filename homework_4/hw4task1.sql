with recursive fib(n, current, previous) as (
    select 0, 1::decimal, 0::decimal
    union all
    select n + 1, previous + current, current
    from fib
    where n < 99
)
select n as nth, current as value
from fib
order by n;