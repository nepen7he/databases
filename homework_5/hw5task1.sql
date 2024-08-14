create or replace function count_non_volatile_days(full_nm text)
returns numeric as
$$
declare
    --if_exists_ numeric := null;
    high_price_ numeric;
    low_price_ numeric;
    counter_ integer := 0;
    date_ varchar;
    all_coins_ integer;
begin
    select count(*) into all_coins_
    from public.coins
    where count_non_volatile_days.full_nm = public.coins.full_nm;
    if all_coins_ = 0 then
        raise exception 'crypto currency with name "%s" is absent in database!',
        full_nm using errcode = '02000';
    end if;

    for low_price_, high_price_, date_ in
        select low_price,
               high_price,
               dt
        from public.coins
        where count_non_volatile_days.full_nm = public.coins.full_nm
        order by public.coins.dt

        loop
        if high_price_ - low_price_ = 0 then
            continue;
        end if;
        counter_ := counter_ + 1;
    end loop;

    return all_coins_ - counter_;
end;
$$ language plpgsql;