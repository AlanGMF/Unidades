from database import Database
from table_customer import Customer


db_db = Database()
#tabla = db_db.fetchByQuery('public.customer')

my_customer = Customer("Leonel", 28, "leo@gmail.com", "Av Rivadavia 2500", "1500")
db_db.saveCustomer(customer=my_customer)
customer = db_db.fetchCustomerById(28)
print(type(customer))
print(customer)
