from pydantic import BaseModel, field_validator, EmailStr
from pydantic_core.core_schema import FieldValidationInfo

# 사용자 정보 스키마
class User(BaseModel):
    id: int
    username: str
    email: str

# 사용자 생성 요청 스키마
class UserCreate(BaseModel):
    username: str
    password1: str
    password2: str
    email: EmailStr

    @field_validator('username', 'password1', 'password2', 'email')
    def not_empty(cls, v):
        # 필드가 비어 있는지 검증
        if not v or not v.strip():
            raise ValueError('빈 값은 허용되지 않습니다.')
        return v
    # 비밀번호 일치여부 확인
    @field_validator('password2')
    def passwords_match(cls, v, info: FieldValidationInfo):
        if 'password1' in info.data and v != info.data['password1']:
            raise ValueError('비밀번호가 일치하지 않습니다')
        return v

# 액세스 토큰 응답 스키마
class Token(BaseModel):
    access_token: str
    token_type: str
    username: str