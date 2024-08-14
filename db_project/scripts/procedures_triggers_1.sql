-- При добавлении новой сессии в базу данных, триггер должен проверять,
-- что количество мест в зале не меньше количества проданных билетов на этот сеанс.
-- Если количество мест по каким-либо причинам оказалось меньше,
-- чем количество билетов, то триггер должен выдать сообщение об ошибке.
create or replace function cinema.check_capacity() returns trigger as
$$
begin
    if exists (
        select 1
        from cinema.session as session
        where
            (select count(*)
            from cinema.session as session
                 inner join cinema.hall as hall
                 on session.hall_id = hall.hall_id)
            <
            (select count(*)
            from cinema.ticket as ticket
                 inner join cinema.session as session
                 on session.session_id = ticket.session_id))
    then
        raise exception 'Error! Not enough seats in the hall for this session.';
    else
        return new;
    end if;
end
$$ language plpgsql;


create trigger check_capacity
after insert on cinema.session
for each row
execute procedure cinema.check_capacity();