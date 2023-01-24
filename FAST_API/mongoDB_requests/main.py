from pymongo import MongoClient
from dotenv import load_dotenv, find_dotenv
import os

load_dotenv(find_dotenv())

password = os.environ.get('MONGODB_PWD')
username = os.environ.get('MONGODB_USER')

def get_database():
    # Replace the below variable as per README file
    CONNECTION_STRING = f"mongodb+srv://{username}:{password}@flutterservers.wp3ngbd.mongodb.net/?retryWrites=true"
    client = MongoClient(CONNECTION_STRING)
    return client.craiglistDB

if __name__ == "__main__":
    dbname = get_database()
