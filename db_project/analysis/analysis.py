import os
import pandas as pd
import psycopg2 as pg

if __name__ == '__main__':
    conn = pg.connect(f"""
        dbname='{os.getenv("DBNAME")}' 
        user='{os.getenv("DBUSER")}' 
        host='{os.getenv("DBHOST")}' 
        port='{os.getenv("DBPORT")}' 
        password='{os.getenv("DBPASSWORD")}'
    """)

    cursor = conn.cursor()

    # для генерации данных использовать библиотеку Faker
    # https://pypi.org/project/Faker/