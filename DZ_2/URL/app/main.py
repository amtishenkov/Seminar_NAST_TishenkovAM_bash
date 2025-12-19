from fastapi import FastAPI, HTTPException
import random
import string
from .db import init_db, get_conn
from .schemas import UrlCreate, UrlResponse, UrlStats

app = FastAPI(title="URL Shortener", version="1.0.0")

def generate_short_id(length=6):
    chars = string.ascii_letters + string.digits
    return ''.join(random.choice(chars) for _ in range(length))

@app.on_event("startup")
def startup():
    init_db()

@app.post("/shorten", response_model=UrlResponse)
def shorten_url(payload: UrlCreate):
    short_id = generate_short_id()
    with get_conn() as conn:
        conn.execute(
            "INSERT INTO urls (short_id, full_url) VALUES (?, ?)",
            (short_id, payload.url)
        )
        conn.commit()
    return UrlResponse(short_id=short_id, full_url=payload.url)

@app.get("/{short_id}")
def redirect_to_url(short_id: str):
    with get_conn() as conn:
        row = conn.execute(
            "SELECT full_url FROM urls WHERE short_id = ?", 
            (short_id,)
        ).fetchone()
        if not row:
            raise HTTPException(status_code=404, detail="URL not found")
        return {"url": row["full_url"]}

@app.get("/stats/{short_id}", response_model=UrlStats)
def get_stats(short_id: str):
    with get_conn() as conn:
        row = conn.execute(
            "SELECT * FROM urls WHERE short_id = ?", 
            (short_id,)
        ).fetchone()
        if not row:
            raise HTTPException(status_code=404, detail="URL not found")
        return UrlStats(
            short_id=row["short_id"],
            full_url=row["full_url"],
            created_at=row["created_at"]
        )
