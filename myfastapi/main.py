from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware
from database import engine, Base
from domain.question import question_router
from domain.answer import answer_router
from domain.user import user_router
app = FastAPI()

# 테이블 생성
Base.metadata.create_all(bind=engine)
origins = [
    "http://localhost:5173",
    "http://127.0.0.1:5173",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(question_router.router)
app.include_router(answer_router.router)
app.include_router(user_router.router)