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
    assert str(select_df.query("film == 'Иди и смотри'")['date'].item() == '2022-02-24')
    assert select_df.query("film == 'Иди и смотри'")['revenue'].item() == 1500
    assert select_df.query("film == 'Иди и смотри'")['rank'].item() == 1

    assert str(select_df.query("film == 'Заводной апельсин'")['date'].item() == '2024-06-11')
    assert select_df.query("film == 'Заводной апельсин'")['revenue'].item() == 700
    assert select_df.query("film == 'Заводной апельсин'")['rank'].item() == 1

    assert str(select_df.query("film == 'Конец Евангелиона'")['date'].item() == '2024-06-12')
    assert select_df.query("film == 'Конец Евангелиона'")['revenue'].item() == 1850
    assert select_df.query("film == 'Конец Евангелиона'")['rank'].item() == 1

    assert str(select_df.query("film == 'Дом, который построил Джек'")['date'].item() == '2024-06-13')
    assert select_df.query("film == 'Дом, который построил Джек'")['revenue'].item() == 1337
    assert select_df.query("film == 'Дом, который построил Джек'")['rank'].item() == 1

    assert str(select_df.query("film == 'Одержимая'")['date'].item() == '2024-06-14')
    assert select_df.query("film == 'Одержимая'")['revenue'].item()== 1550
    assert select_df.query("film == 'Одержимая'")['rank'].item() == 1

    assert str(select_df.query("film == 'Гаттака'")['date'].item() == '2024-06-15')
    assert select_df.query("film == 'Гаттака'")['revenue'].item() == 350
    assert select_df.query("film == 'Гаттака'")['rank'].item() == 1

    assert str(select_df.query("film == 'Изгоняющий дьявола'")['date'].item() == '2024-06-21')
    assert select_df.query("film == 'Изгоняющий дьявола'")['revenue'].item() == 900
    assert select_df.query("film == 'Изгоняющий дьявола'")['rank'].item() == 1

# Скрипт тестирует соответствие даты, ранга и выручки фильмам