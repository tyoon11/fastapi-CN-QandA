from datetime import timedelta, datetime

from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import OAuth2PasswordRequestForm, OAuth2PasswordBearer
from jose import jwt, JWTError
from sqlalchemy.orm import Session
from starlette import status

from database import get_db
from domain.user import user_crud, user_schema
from domain.user.user_crud import pwd_context

# 액세스 토큰 설정
ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 24 # 토큰 만료 시간 (24시간)
SECRET_KEY = "4ab2fce7a6bd79e1c014396315ed322dd6edb1c5d975c6b74a2904135172c03c" # 비밀키
ALGORITHM = "HS256" # 토큰 알고리즘
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/user/login") # OAuth2 토큰 URL

# 사용자 관련 라우터 설정
router = APIRouter(
    prefix = "/api/user",
)

# 사용자 생성 API
@router.post("/create", status_code=status.HTTP_204_NO_CONTENT)
def user_create(_user_create: user_schema.UserCreate, db: Session=
Depends(get_db)):
    user = user_crud.get_existing_user(db, user_create=_user_create)
    if user:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT,
                            detail="이미 존재하는 사용자입니다.")
    user_crud.create_user(db=db, user_create=_user_create)

# 로그인 API
@router.post("/login", response_model=user_schema.Token)
def login_for_access_token(form_data: OAuth2PasswordRequestForm = Depends(),
                           db: Session = Depends(get_db)):
    # 사용자 인증
    user = user_crud.get_user(db, form_data.username)
    if not user or not pwd_context.verify(form_data.password, user.password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="잘못된 사용자나 비밀번호입니다",
            headers={"WWW-Authenticate": "Bearer"},
        )

    # 액세스 토큰 생성
    data = {
        "sub": user.username,
        "exp": datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    }
    access_token = jwt.encode(data, SECRET_KEY, algorithm=ALGORITHM)

    return {
        "access_token": access_token,
        "token_type": "bearer",
        "username": user.username
    }

# 현재 사용자 조회
def get_current_user(token: str = Depends(oauth2_scheme),
                     db: Session = Depends(get_db)):
    # 액세스 토큰을 검증하고 현재 사용자 조회
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="잘못된 접근입니다.",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        # 토큰을 복호화하여 사용자 조회
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
    except JWTError:
        raise credentials_exception
    else:
        user = user_crud.get_user(db, username=username)
        if user is None:
            raise credentials_exception
        return user