from typing import Optional
from pydantic import BaseModel


class User(BaseModel):
    first_name: Optional[str]
    last_name: Optional[str]
    email: str
    password: str
    gender: Optional[str]
    roles: Optional[dict]
