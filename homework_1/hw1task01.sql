select min(public.hw.height) as min_height,
       max(public.hw.height) as max_height,
       min(public.hw.weight) as min_weight,
       max(public.hw.weight) as max_weight
from public.hw;