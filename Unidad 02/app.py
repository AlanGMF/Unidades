from decouple import config

HOST = config('MySQL_HOST')
PORT = config('MySQL_PORT')
USER = config('MySQL_USER')
PWD = config('MySQL_PASSWORD')

print(f"host = {HOST} port = {PORT} user = {USER} pwd = {PWD}")