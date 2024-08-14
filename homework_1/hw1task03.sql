select count(*) as underweight_count
FROM public.hw
WHERE ((weight / 2.2046) / (height * 0.0254 * height * 0.0254 )) < 18.5;