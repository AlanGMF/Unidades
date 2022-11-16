import os
from dotenv import load_dotenv, find_dotenv

load_dotenv (find_dotenv())

HOST = os.getenv('MySQL_HOST')
PORT = os.getenv('MySQL_PORT')
USER = os.getenv('MySQL_USER')
PWD = os.getenv('MySQL_PASSWORD')

print(f"host = {HOST} port = {PORT} user = {USER} pwd = {PWD}")
