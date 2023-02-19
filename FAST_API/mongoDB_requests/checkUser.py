from mongoDB_requests.main import get_database
import datetime


def checkUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    sessionTime = datetime.timedelta(minutes=30)
    timeStamp = datetime.datetime.now() + sessionTime
    try:
        found = usersCollection.find_one({
            "email": userInfo.email,
            "password": userInfo.password
        })
        if (found == None):
            return {"status": 400, "body": {}, "timestamp": timeStamp, "message": "User not found"}
        return {"status": 200, "body": found, "timestamp": timeStamp, "message": "Success"}
    except:
        return {"status": 500, "body": {}, "timestamp": timeStamp, "message": "Unable to log user in. Try again."}
