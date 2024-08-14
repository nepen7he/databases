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
    assert select_df.query("position == 'Бухгалтер'")['average_salary'].item() == 45000
    assert select_df.query("position == 'Киноинженер'")['average_salary'].item() == 35000
    assert select_df.query("position == 'Менеджер'")['average_salary'].item() == 50000
    assert select_df.query("position == 'Уборщик'")['average_salary'].item() == 19500
    assert select_df.query("position == 'Капельдинер'")['average_salary'].item() == 30000
    assert select_df.query("position == 'Киномеханик'")['average_salary'].item() == 35000
    assert select_df.query("position == 'Кассир'")['average_salary'].item() == 30000

# Скрипт тестирует соответствие зарплат позициям