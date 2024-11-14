import os
from sqlalchemy import create_engine, MetaData
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# SQLALCHEMY_DATABASE_URL = os.environ.get("SQLALCHEMY_DATABASE_URL") # DB 접속 주소
SQLALCHEMY_DATABASE_URL = "mysql+pymysql://root:0110@localhost/myapp_sql"
# DB 접속 객체(커넥션 풀) 생성
engine = create_engine(
    SQLALCHEMY_DATABASE_URL, echo=True
)
# DB 접속 클래스 생성
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# autocommit=False 데이터를 변경 했을 때 commit을 해야만 실제 저장
Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()