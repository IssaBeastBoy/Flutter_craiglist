from pymongo import MongoClient


def get_database():
    CONNECTION_STRING = "mongodb+srv://<Username>:<password>@flutterservers.wp3ngbd.mongodb.net/?retryWrites=true&w=majority"
    client = MongoClient(CONNECTION_STRING)
    return client['craiglist_info']


if __name__ == "__main__":
    dbname = get_database()
