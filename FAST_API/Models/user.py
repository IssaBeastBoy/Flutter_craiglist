from pydantic import BaseMode
from uiid import UUID, uuid4
from enum import Enum
from typing import Optional, List

class Gender(str, Enum):
    male="male"
    female = "female"
    
class User( BaseModel):
    id: Optional[UUID] = uuid4()
    first_name: str
    last_name: str
    middle_name: Optional[str]
    gender: Gender
    roles: List[str]