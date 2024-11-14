# myfastapi/Dockerfile
FROM python:3.11
# 작업 디렉토리 설정
WORKDIR /src

# 필요한 라이브러리 설치
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
