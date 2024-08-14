create schema if not exists cinema;

create table if not exists cinema.film(
    film_id          SERIAL      PRIMARY KEY,
    film_nm          VARCHAR     NOT NULL,
    director         VARCHAR     NOT NULL,
    duration_min     INTEGER     CHECK (duration_min > 0)
);

create table if not exists cinema.genre(
    genre_id         SERIAL      PRIMARY KEY,
    genre_nm         VARCHAR     NOT NULL
);


create table if not exists cinema.film_x_genre(
    film_id          SERIAL     NOT NULL,
    genre_id         SERIAL     NOT NULL,

    PRIMARY KEY (film_id, genre_id),
    FOREIGN KEY (film_id)  REFERENCES cinema.film(film_id),
    FOREIGN KEY (genre_id) REFERENCES cinema.genre(genre_id)
);

create table if not exists cinema.hall(
    hall_id          SERIAL      PRIMARY KEY,
    hall_nm          VARCHAR     NOT NULL,
    number_of_sits   INTEGER     CHECK(number_of_sits > 0)
);

create table if not exists cinema.place(
    place_id        SERIAL      PRIMARY KEY,
    hall_id         SERIAL      NOT NULL,
    number_of_row   INTEGER     CHECK (number_of_row >= 0),
    number_of_sit   INTEGER     CHECK (number_of_sit >= 0),

    FOREIGN KEY (hall_id) REFERENCES cinema.hall(hall_id)
);

create table if not exists cinema.session(
    session_id      SERIAL      PRIMARY KEY,
    session_dt      DATE        NOT NULL,
    session_tm      TIME        NOT NULL,
    hall_id         SERIAL      NOT NULL,
    film_id         SERIAL      NOT NULL,

    FOREIGN KEY (hall_id) REFERENCES cinema.hall(hall_id),
    FOREIGN KEY (film_id) REFERENCES cinema.film(film_id)
);

create table if not exists cinema.employee(
    employee_id         SERIAL      PRIMARY KEY,
    employee_nm         VARCHAR     NOT NULL,
    employee_salary     INTEGER     CHECK (employee_salary > 0),
    employee_position   VARCHAR     NOT NULL,
    employee_settled    TIMESTAMP   NOT NULL,
    employee_retired    TIMESTAMP   NOT NULL
);

create table if not exists cinema.ticket(
    ticket_id       SERIAL      PRIMARY KEY,
    ticket_cost     INTEGER     CHECK (ticket_cost > 0),
    place_id        SERIAL      NOT NULL,
    session_id      SERIAL      NOT NULL,
    employee_id     SERIAL      NOT NULL,

    FOREIGN KEY (place_id) REFERENCES cinema.place(place_id),
    FOREIGN KEY (session_id) REFERENCES cinema.session(session_id),
    FOREIGN KEY (employee_id) REFERENCES cinema.employee(employee_id)
);
