select dt, high_price, vol
from public.coins
where symbol = 'DOGE' and avg_price < 100 and dt like '2018%';