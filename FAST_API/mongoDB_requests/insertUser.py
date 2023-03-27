from mongoDB_requests.main import get_database
import datetime


def insertUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    timeStamp = datetime.strftime("%d %B %Y")
    print(userInfo)
    newUser = {
        "email": userInfo.email,
        "password": userInfo.password,
        "name": userInfo.name,
        "surname": userInfo.surname,
        "created": timeStamp,
        "roles": {}
    }
    try:
        found = usersCollection.find_one({
            "email": newUser.email
        })
        if(found == None):
            documentId = usersCollection.insert_one(newUser).inserted_id
            return {"status": 200, "body": {"_id": documentId}, "message": "Success"}
        else:
            return {"status": 400, "body": {},"message": "User already exists"}
    except:
        return {"status": 500, "body": {},"message": "Unable to create user. Try again."}
