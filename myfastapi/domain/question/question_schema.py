import datetime

from pydantic import BaseModel, field_validator

from domain.answer.answer_schema import Answer
from domain.user.user_schema import User

# 질문 상세 정보 스키마
class Question(BaseModel):
    id: int
    subject: str
    content: str
    create_date: datetime.datetime
    answers: list[Answer] = []
    user: User | None
    modify_date: datetime.datetime | None = None
    voter: list[User] = []
    
# 질문 생성 요청 스키마
class QuestionCreate(BaseModel):
    subject: str
    content: str

    @field_validator('subject', 'content')
    def not_empty(cls, v):
        # 제목과 내용이 비어 있는지 검증
        if not v or not v.strip():
            raise ValueError('빈 값은 허용되지 않습니다.')
        return v
# 질문 목록 응답 스키마
class QuestionList(BaseModel) :
    total: int = 0
    question_list: list[Question] = []

# 질문 수정 요청 스키마
class QuestionUpdate(QuestionCreate):
    question_id: int

# 질문 삭제 요청 스키마
class QuestionDelete(BaseModel):
    question_id: int

# 질문 추천 요청 스키마
class QuestionVote(BaseModel):
    question_id:int