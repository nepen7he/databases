import os
import pytest
import datetime
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
    df_0 = select_df.iloc[0]
    assert str(df_0['date']) == '2022-02-24'
    assert df_0['first_session_time'] == datetime.time(18, 0)
    assert df_0['first_session_film'] == 'Иди и смотри'
    assert df_0['first_session_hall'] == 'Lux Aeterna'
    assert df_0['last_session_time'] == datetime.time(18, 0)
    assert df_0['last_session_film'] == 'Иди и смотри'
    assert df_0['last_session_hall'] == 'Lux Aeterna'

    df_1 = select_df.iloc[1]
    assert str(df_1['date']) == '2024-06-11'
    assert df_1['first_session_time'] == datetime.time(15, 30)
    assert df_1['first_session_film'] == 'Заводной апельсин'
    assert df_1['first_session_hall'] == 'Хлеба и зрелищ'
    assert df_1['last_session_time'] == datetime.time(15, 30)
    assert df_1['last_session_film'] == 'Заводной апельсин'
    assert df_1['last_session_hall'] == 'Хлеба и зрелищ'

    df_2 = select_df.iloc[2]
    assert str(df_2['date']) == '2024-06-12'
    assert df_2['first_session_time'] == datetime.time(11, 0)
    assert df_2['first_session_film'] == 'Конец Евангелиона'
    assert df_2['first_session_hall'] == 'Чёртово колесо'
    assert df_2['last_session_time'] == datetime.time(11, 0)
    assert df_2['last_session_film'] == 'Конец Евангелиона'
    assert df_2['last_session_hall'] == 'Чёртово колесо'

    df_3 = select_df.iloc[3]
    assert str(df_3['date']) == '2024-06-13'
    assert df_3['first_session_time'] == datetime.time(17, 0)
    assert df_3['first_session_film'] == 'Дом, который построил Джек'
    assert df_3['first_session_hall'] == 'Smoking blunt'
    assert df_3['last_session_time'] == datetime.time(17, 0)
    assert df_3['last_session_film'] == 'Дом, который построил Джек'
    assert df_3['last_session_hall'] == 'Smoking blunt'

    df_4 = select_df.iloc[4]
    assert str(df_4['date']) == '2024-06-14'
    assert df_4['first_session_time'] == datetime.time(19, 0)
    assert df_4['first_session_film'] == 'Одержимая'
    assert df_4['first_session_hall'] == 'Oldschool'
    assert df_4['last_session_time'] == datetime.time(19, 0)
    assert df_4['last_session_film'] == 'Одержимая'
    assert df_4['last_session_hall'] == 'Oldschool'

    df_5 = select_df.iloc[5]
    assert str(df_5['date']) == '2024-06-15'
    assert df_5['first_session_time'] == datetime.time(20, 0)
    assert df_5['first_session_film'] == 'Гаттака'
    assert df_5['first_session_hall'] == 'Heartbreaker'
    assert df_5['last_session_time'] == datetime.time(20, 0)
    assert df_5['last_session_film'] == 'Гаттака'
    assert df_5['last_session_hall'] == 'Heartbreaker'
# Скрипт тестирует соответствие описания сеансов конкретной дате