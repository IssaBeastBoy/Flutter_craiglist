from mongoDB_requests.main import get_database
import datetime


def insertUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    sessionTime = datetime.timedelta(minutes=30)
    timeStamp = datetime.datetime.now() + sessionTime
    print(userInfo)
    newUser = {
        "email": userInfo.email,
        "password": userInfo.password,
        "name": userInfo.name,
        "surname": userInfo.surname,
        "roles": {}
    }
    try:
        found = usersCollection.find_one({
            "email": newUser.email
        })
        if(found == None):
            documentId = usersCollection.insert_one(newUser).inserted_id
            return {"status": 200, "body": {"_id": documentId}, "timestamp": timeStamp, "message": "Success"}
        else:
            return {"status": 400, "body": {}, "timestamp": timeStamp, "message": "User already exists"}
    except:
        return {"status": 500, "body": {}, "timestamp": timeStamp, "message": "Unable to create user. Try again."}
