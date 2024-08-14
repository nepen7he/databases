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
    assert select_df.query("film_nm == 'Догвилль'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Изгой'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Дом, который построил Джек'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Форрест Гамп'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Иди и смотри'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Изгоняющий дьявола'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Заводной апельсин'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Одержимая'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Гаттака'")['dense_rank'].item() == 1
    assert select_df.query("film_nm == 'Конец Евангелиона'")['dense_rank'].item() == 1

# Скрипт тестирует соответствие ранжировки фильмам