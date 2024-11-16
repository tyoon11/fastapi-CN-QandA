from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey, Table
from sqlalchemy.orm import relationship, backref
from database import Base

# 질문 추천 테이블 (many-to-many)
question_voter = Table(
    'question_voter',
    Base.metadata,
    Column('user_id', Integer, ForeignKey('user.id'), primary_key=True),
    Column('question_id', Integer, ForeignKey('question.id'), primary_key=True)
)

# 답변 추천 테이블 (many-to-many)
answer_voter = Table(
    'answer_voter',
    Base.metadata,
    Column('user_id', Integer, ForeignKey('user.id'), primary_key=True),
    Column('answer_id', Integer, ForeignKey('answer.id'), primary_key=True)
)


# 질문 모델
class Question(Base):
    __tablename__ = 'question'

    id = Column(Integer, primary_key=True) # 질문 ID (기본키)
    subject = Column(String(255), nullable=False) # 질문 제목
    content = Column(Text, nullable=False) # 질문 내용
    create_date = Column(DateTime, nullable=False) # 생성일
    user_id = Column(Integer, ForeignKey("user.id"), nullable=True) # 작성자 ID (외래키)
    user = relationship("User", backref='question_users') # 작성자와의 관계 설정
    modify_date = Column(DateTime, nullable=True) # 수정일
    voter = relationship('User', secondary=question_voter, backref='question_voters') # 추천 사용자와의 관계 설정

# 답변 모델
class Answer(Base):
    __tablename__ = 'answer'

    id = Column(Integer, primary_key=True)  # 답변 ID (기본키)
    content = Column(String(255), nullable=False)  # 답변 내용
    create_date = Column(DateTime, nullable=False)  # 생성일
    question_id = Column(Integer, ForeignKey('question.id'))  # 질문 ID (외래키)
    question = relationship('Question', backref='answers')  # 질문과의 관계 설정
    user_id = Column(Integer, ForeignKey("user.id"), nullable=True)  # 작성자 ID (외래키)
    user = relationship("User", backref="answer_users")  # 작성자와의 관계 설정
    modify_date = Column(DateTime, nullable=True)  # 수정일
    voter = relationship('User', secondary=answer_voter, backref='answer_voters')  # 추천 사용자와의 관계 설정

# 사용자 모델
class User(Base):
    __tablename__ = "user"

    id = Column(Integer, primary_key=True)  # 사용자 ID (기본키)
    username = Column(String(50), unique=True, nullable=False)  # 사용자명
    password = Column(String(255), nullable=False)  # 암호화된 비밀번호
    email = Column(String(50), unique=True, nullable=False)  # 이메일 주소
