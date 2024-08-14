
-- Иногда нам может понадобиться поиск по названию фильма, зала, жанра,
-- по имени сотрудника, которые расположены не в алфавитном порядке. Аналогично для должностей.
-- Воспользуемся индексами для быстрого поиска, для регистронезависимости поиска используем uppercase
create index on cinema.film(upper(film_nm));
create index on cinema.hall(upper(hall_nm));
create index on cinema.genre(upper(genre_nm));
create index on cinema.employee(upper(employee_nm));
create index on cinema.employee(upper(employee_position));

-- Билеты упорядочим по дате по возрастанию
create index on cinema.session(session_dt asc);