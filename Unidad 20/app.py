import sqlite3
import pandas as pd
#import sqlalchemy as db

medals = pd.read_csv("http://winterolympicsmedals.com/medals.csv")

usa_gold_medals = medals[
                        (medals['NOC'] == 'USA') 
                        & (medals['Medal'] == 'Gold') 
                        & (medals['Year']>=1950)
                    ]
usa_gold_medals.head()

# Se crear la conexión a la base de datos y el cursor
conn = sqlite3.connect('olympics.db')
cursor = conn.cursor()


# Se crear la tabla
query = """CREATE TABLE IF NOT EXISTS medals (
            Year INTEGER,
            City TEXT NOT NULL,
            Sport TEXT NOT NULL,
            Discipline TEXT NOT NULL,
            NOC TEXT NOT NULL,
            Event TEXT NOT NULL,
            Event_gender TEXT NOT NULL,
            Medal TEXT NOT NULL
            );"""

cursor.execute(query)
conn.commit()


# Se cargan los datos
order_data = list(usa_gold_medals.itertuples(index=False, name=None))
cursor.executemany("INSERT INTO medals VALUES (?, ?, ?, ?, ?, ?, ?, ?)", order_data)

conn.commit()

# Se cierra la conexión
conn.close()