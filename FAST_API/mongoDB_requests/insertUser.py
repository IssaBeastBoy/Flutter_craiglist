from mongoDB_requests.main import get_database


def insertUser(userInfo):
    collections = get_database()
    usersCollection = collections.users
    newUser = {
        "email": userInfo.email,
        "password": userInfo.password,
        "gender": userInfo.gender,
        "first_name": userInfo.first_name,
        "last_name": userInfo.last_name,
        "roles": {}
    }
    try:
        usersCollection.insert_one(newUser)
        return {"status": 200, "body": "Success"}
    except:
        return {"status": 500, "body": "Error"}
