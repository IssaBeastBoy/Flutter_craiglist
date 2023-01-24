from fastapi import FastAPI

app = FastAPI()

@app.get("/users")
def root():    
    return{"Start":"Hello World"}

