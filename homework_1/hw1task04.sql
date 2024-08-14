select id, ((weight / 2.2046) / (pow(height * 0.0254, 2))) as bmi,
    case
        when ((weight / 2.2046) / (pow(height * 0.0254, 2))) < 18.5 then 'underweight'
        when ((weight / 2.2046) / (pow(height * 0.0254, 2))) >= 18.5 and
             ((weight / 2.2046) / (pow(height * 0.0254, 2))) < 25 then 'normal'
        when ((weight / 2.2046) / (pow(height * 0.0254, 2))) >= 25 and
             ((weight / 2.2046) / (pow(height * 0.0254, 2))) < 30 then 'overweight'
        when ((weight / 2.2046) / (pow(height * 0.0254, 2))) >= 30 and
             ((weight / 2.2046) / (pow(height * 0.0254, 2))) < 35 then 'obese'
        when ((weight / 2.2046) / (pow(height * 0.0254, 2))) >= 35 then 'extremely obese'
    end as type
FROM public.hw
order by bmi DESC;