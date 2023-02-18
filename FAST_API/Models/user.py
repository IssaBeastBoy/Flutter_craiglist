from typing import Union
from pydantic import BaseModel


class User(BaseModel):
    name: Union[str, None] = None
    surname: Union[str, None] = None
    email: str
    password: str
    gender: Union[str, None] = None
    roles:  Union[list, None] = None
