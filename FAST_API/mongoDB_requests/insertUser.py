from mongoDB_requests.main import get_database
import datetime


def insertUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    sessionTime = datetime.timedelta(minutes=30)
    timeStamp = datetime.datetime.now() + sessionTime
    newUser = {
        "email": userInfo.email,
        "password": userInfo.password,
        "first_name": userInfo.first_name,
        "last_name": userInfo.last_name,
        "roles": {}
    }
    try:
        documentId = usersCollection.insert_one(newUser).inserted_id
        return {"status": 200, "body": documentId, "timestamp": timeStamp}
    except:
        return {"status": 500, "body": "Unable to create user. Try again."}
