from passlib.context import CryptContext
from sqlalchemy.orm import Session
from domain.user.user_schema import UserCreate
from models import User

# 비밀번호 암호화 설정
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# 사용자 생성
def create_user(db: Session, user_create: UserCreate):
    # 새로운 사용자를 생성하여 데이터베이스에 저장
    # bcrypt로 비밀번호 암호화
    db_user = User(username=user_create.username,
                   # 암호화 하여 저장
                   password=pwd_context.hash(user_create.password1),
                   email=user_create.email)
    db.add(db_user)
    db.commit()

# 사용자 존재 확인
def get_existing_user(db: Session, user_create: UserCreate):
    # username 또는 email이 존재하는지 확인
    return db.query(User).filter(
        (User.username == user_create.username) |
        (User.email == user_create.email)
    ).first()

# 사용자 명으로 특정 사용자를 조회
def get_user(db: Session, username: str):
    return db.query(User).filter(User.username == username).first()