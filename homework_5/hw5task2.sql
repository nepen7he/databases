create or replace function serial_generator(start_val integer, last_val integer)
returns setof integer as 
$$
declare
    num integer := start_val;
begin
    while num < last_val loop
        return next num;
        num := num + 1;
    end loop;
    return;
end;
$$ language plpgsql;