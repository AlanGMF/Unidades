import sqlalchemy
import sqlalchemy 
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column
from sqlalchemy import MetaData, Table, Column
from sqlalchemy.orm import Session
from table_customer import Customer



class Database():

    engine = sqlalchemy.create_engine("postgresql://postgres:1234@localhost:5432/test")

    def __init__(self):
        self.connection = self.engine.connect()
        print("DB instance create")


    def fetchByQuery(self, query):
        fetchQuery = self.connection.execute(f"SELECT * FROM {query}")
        for data in fetchQuery:
            print(data)

    # Insert values of Customer
    def saveCustomer(self, customer):
        self.connection.execute(f"""INSERT INTO customer( name, age, email, address, zip_code)
                                    VALUES('{customer.name}',
                                            '{customer.age}',
                                            '{customer.email}',
                                            '{customer.address}',
                                            '{customer.zip_code}')""")


    def fetchByName(self):
        meta = MetaData()
        customer = Table('customer', meta, Column('name'))
        data = self.connection.execute(customer.select())
        for cust in data:
            print(cust)

    # Update Customer
    def fetchCustomerById(self, customer_id):
        session = Session(bind=self.connection)
        customerData = session.query(Customer).filter(Customer.name ==customer_id)
        return customerData

    # Create Customer
    def saveData(self, customer):
        session = Session(bind=self.connection)
        session.add(customer)
        session.commit()

    # Update Customer
    def updateCustomer(self, customerName, address):
        session = Session(bind=self.connection)
        dataToUpdate = {Customer.address: address}
        customerData = session.query(Customer).filter(Customer.name ==customerName)
        customerData.update(dataToUpdate)
        session.commit()

    # Delete Customer
    def deleteCustomer(self, customer):
        session = Session(bind=self.connection)
        customerData = session.query(Customer).filter(Customer.name ==customer).first()
        session.delete(customerData)
        session.commit()

    



