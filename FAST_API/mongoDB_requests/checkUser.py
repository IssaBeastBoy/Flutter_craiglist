from mongoDB_requests.main import get_database
import datetime


def checkUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    try:
        found = usersCollection.find_one({
            "email": userInfo.email,
            "password": userInfo.password
        })
        found["_id"] = str(found["_id"])
        if (found == None):
            return {"status": 400, "body": {},  "message": "User not found"}
        return {"status": 200, "body": found, "message": "Success"}
    except:
        return {"status": 500, "body": {}, "message": "Unable to log user in. Try again."}
