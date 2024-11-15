from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware
from database import engine, Base
from domain.question import question_router
from domain.answer import answer_router
from domain.user import user_router
app = FastAPI()

# 테이블 생성
Base.metadata.create_all(bind=engine)
# CORS 문제 해결
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(question_router.router)
app.include_router(answer_router.router)
app.include_router(user_router.router)