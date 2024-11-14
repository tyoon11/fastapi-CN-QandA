import os
import time
from sqlalchemy import create_engine, text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import OperationalError

SQLALCHEMY_DATABASE_URL = os.getenv("SQLALCHEMY_DATABASE_URL", "mysql+pymysql://myapp-sql:123456@mysql/myapp_sql")

# 데이터베이스 엔진 생성 함수에 재시도 로직 추가
def create_db_engine():
    while True:
        try:
            engine = create_engine(SQLALCHEMY_DATABASE_URL)
            # 연결 확인을 위한 테스트 쿼리 실행
            with engine.connect() as conn:
                conn.execute(text("SELECT 1"))  # 수정된 부분
            print("Successfully connected to the database.")
            return engine
        except OperationalError:
            print("Database connection failed. Retrying in 5 seconds...")
            time.sleep(5)

engine = create_db_engine()
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
