from pydantic import BaseModel

class UrlCreate(BaseModel):
    url: str

class UrlResponse(BaseModel):
    short_id: str
    full_url: str

class UrlStats(BaseModel):
    short_id: str
    full_url: str
    created_at: str
