-- При любом добавлении или изменении строки в таблице триггер должен
-- сохранить в этой строке информацию о текущем пользователе и отметку времени.


create or replace function cinema.log_employee_changes() returns trigger as
$$
declare
    operation_text text;
    user_name text;
begin
    user_name = session_user;
    if (tg_op = 'insert') then
        operation_text = 'insert';
    elsif (tg_op = 'update') then
        operation_text = 'update';
    elsif (tg_op = 'delete') then
        operation_text = 'delete';
    end if;

    insert into employee_log(operation_text, operation_time, user_name, new_values)
    values (operation_text, now(), user_name, row(new.*));

    return new;
end;
$$ language plpgsql;

create trigger employee_changes_trigger
after insert or update or delete on cinema.employee
for each row
execute procedure cinema.log_employee_changes();