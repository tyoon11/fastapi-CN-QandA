from pydantic import BaseModel, field_validator
import datetime
from domain.user.user_schema import User

# 답변 생성 요청 스키마
class AnswerCreate(BaseModel):
    content: str

    @field_validator('content')
    def not_empty(cls, v):
        if not v or not v.strip():
            raise ValueError('빈 값은 허용되지 않습니다.')
        return v

# 답변 출력 스키마
class Answer(BaseModel):
    id: int
    content: str
    create_date: datetime.datetime
    user: User | None
    question_id: int
    modify_date: datetime.datetime | None = None
    voter: list[User] = []
# 답변 수정 요청 스키마
class AnswerUpdate(AnswerCreate):
    answer_id: int
    
# 답변 삭제 요청 스키마
class AnswerDelete(BaseModel):
    answer_id: int

# 답변 추천 요청 스키마
class AnswerVote(BaseModel):
    answer_id: int