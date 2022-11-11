
import sqlalchemy 
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, Integer
from sqlalchemy import MetaData, Table, Column
from sqlalchemy.orm import Session

Base = declarative_base()

class Database():

    engine = sqlalchemy.create_engine('postgresql://postgres:example@5432/test')
    def __init__(self):
        self.connection = self.engine.connect()
        print("DB instance create")

    def fetchByQuery(self, query):
        fetchQuery = self.connection.execute(f"SELECT * FROM {query}")
        for data in fetchQuery:
            print(data)

    def saveeData(self, customer):
        self.connection.execute(f"""INSERT INTO customer( name, age, email, address, zip_code)
                                    VALUES('{customer.name}',
                                            '{customer.age}',
                                            '{customer.email}',
                                            '{customer.address}',
                                            '{customer.zip_code}',)""")

    def fetchByName(self):
        meta = MetaData()
        customer = Table('customer', meta, Column('name'))
        data = self.connection.execute(customer.select())
        for cust in data:
            print(cust)

    def fetchAllUsers(self):
        self.session = Session(bind= self.connection)
        customers = self.session.query(Customer).all()

        for cust in customers:
            print(cust)
                                            

class Customer(Base):
    __tablename__ = 'customer'
    
    name = Column(String)
    age = Column(Integer)
    email = Column(String)
    address = Column(String)
    zip_code = Column(String)
    id = Column(Integer, primary_key= True)

    def __repr__(self):
        return "<Customer(name='%s', age='%s', email='%s', address='%s', zip_code='%s',)>" %(self.name, self.age, self.email, self.address, self.zip_code)

    def __init__(self, name, age, email, address, zip_code):
        self.name = name
        self.age = age
        self.email = email
        self.address = address
        self.zip_code = zip_code


customerr = Customer("Leonel", 28, "leo@gmail.com", "Av Rivadavia 2500", "1500")
dbase = Database()
dbase.saveeData(customer=customerr)
dbase.fetchByQuery('public.customer')




