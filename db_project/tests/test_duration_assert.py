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
    assert select_df.query("film_nm == 'Догвилль'")['duration_min'].item() == 177
    assert select_df.query("film_nm == 'Изгой'")['duration_min'].item() == 177
    assert select_df.query("film_nm == 'Дом, который построил Джек'")['duration_min'].item() == 155
    assert select_df.query("film_nm == 'Форрест Гамп'")['duration_min'].item() == 144
    assert select_df.query("film_nm == 'Иди и смотри'")['duration_min'].item() == 144
    assert select_df.query("film_nm == 'Изгоняющий дьявола'")['duration_min'].item() == 144
    assert select_df.query("film_nm == 'Заводной апельсин'")['duration_min'].item() == 137
    assert select_df.query("film_nm == 'Одержимая'")['duration_min'].item() == 127
    assert select_df.query("film_nm == 'Гаттака'")['duration_min'].item() == 106
    assert select_df.query("film_nm == 'Конец Евангелиона'")['duration_min'].item() == 87

# Скрипт тестирует соответствие длительности фильмам