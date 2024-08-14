import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_script():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path)


@pytest.fixture()
def select_df(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script
    )


def test(select_df):
    assert select_df.query("genre_nm == 'Драма'")['populairty'].item() == 7
    assert select_df.query("genre_nm == 'Драма'")['rank'].item() == 1

    assert select_df.query("genre_nm == 'Фантастика'")['populairty'].item() == 5
    assert select_df.query("genre_nm == 'Фантастика'")['rank'].item() == 2

    assert select_df.query("genre_nm == 'Ужасы'")['populairty'].item() == 4
    assert select_df.query("genre_nm == 'Ужасы'")['rank'].item() == 3

    assert select_df.query("genre_nm == 'Криминал'")['populairty'].item() == 3
    assert select_df.query("genre_nm == 'Криминал'")['rank'].item() == 4

    assert select_df.query("genre_nm == 'Аниме'")['populairty'].item() == 2
    assert select_df.query("genre_nm == 'Аниме'")['rank'].item() == 5

    assert select_df.query("genre_nm == 'Мультфильм'")['populairty'].item() == 2
    assert select_df.query("genre_nm == 'Мультфильм'")['rank'].item() == 5

    assert select_df.query("genre_nm == 'Боевик'")['populairty'].item() == 2
    assert select_df.query("genre_nm == 'Боевик'")['rank'].item() == 5

    assert select_df.query("genre_nm == 'Триллер'")['populairty'].item() == 1
    assert select_df.query("genre_nm == 'Триллер'")['rank'].item() == 6

    assert select_df.query("genre_nm == 'История'")['populairty'].item() == 1
    assert select_df.query("genre_nm == 'История'")['rank'].item() == 6

    assert select_df.query("genre_nm == 'Детектив'")['populairty'].item() == 1
    assert select_df.query("genre_nm == 'Детектив'")['rank'].item() == 6

    assert select_df.query("genre_nm == 'Военный'")['populairty'].item() == 1
    assert select_df.query("genre_nm == 'Военный'")['rank'].item() == 6

# Скрипт тестирует соответствие популярности конкретному жанру