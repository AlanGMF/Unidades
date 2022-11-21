import sqlalchemy 
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session

engine = sqlalchemy.create_engine("postgresql://postgres:1234@localhost:5432/test")
sesion = Session(bind= engine)

Base = declarative_base()

