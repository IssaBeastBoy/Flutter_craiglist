from fastapi import FastAPI

# DB imports
from mongoDB_requests.checkUser import checkUser
from mongoDB_requests.insertUser import insertUser

# Model imports
from Models.user import User

app = FastAPI()


@app.post("/api/v1/login")
async def logIn(userInfo: User):
    return checkUser(userInfo)


@app.post("/api/v1/register")
async def register(userInfo: User):
    return insertUser(userInfo)
