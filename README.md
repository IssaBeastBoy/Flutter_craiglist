# Flutter_craiglist
A mobile app which will functions as the craiglist. Where users can access different vendors. 

**Note - Both the API and the flutter emulator have to be running locally.**

## DataBase
### MongoDB
##### The Mongo DB no SQL data base is used as the data storage structure for this application.
-----
##### [MongoDB Commmunity Create Account](https://account.mongodb.com/account/login)
-----
Use the link anove to create a Mongo Alas user account, which will give you options on how to set up your account. Follow all the instructions and start up your MongoDB cluster.

**Note - Create a .env file in the FAST_API directory with *MONGODB_PWD =* and *MONGODB_USER =* variables. You need to place you cluster login credentails to your cluster in the FAST_API/.env file with your username and password. Lastly, copy the MongoDB *connection your application* web UI string onto the CONNECTION_STRING variable in the FAST_API/mongoDB_requests/main.py**
Requirements:
- Python 3.9 >= 
- PyMongo

## RESTAPI
### Python FASTAPI
##### The Python FASTAPI package is used to execute all the HTTP request between the backend and front.
-----
##### [Installation and Docs](https://pypi.org/project/fastapi/)
-----
For testing locally run the API start up command from the director:
- **FAST_API** folder in this repository contains the main.py which will start the API with all the endpoint used in the application.
- Once navigated to the directory above run:

    `uvicorn main:app --reload`

- Use the URL given in the output of the command above on your browser to access the different endpoint in the code.


## Mobile Application

### Flutter Andriod
#### The flutter code will be what the use interacts to access all the craiglist functionality of the application.
-----
##### [Installation and Docs](https://docs.flutter.dev/get-started/install)
-----
Once all the installation has been done, enter the flutter/ directory and run:
    `flutter run`