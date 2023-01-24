from mongoDB_requests.main import get_database


def getUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    try:
        found = usersCollection.find_one({
            "email": userInfo.email,
            "password": userInfo.password
        })
        if (found == None):
            return {"status": 400, "body": "Wrong inputs"}
        return {"status": 200, "body": "Success"}
    except:
        return {"status": 500, "body": "Error"}
