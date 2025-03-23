FROM python:3.9.6-alpine3.14

WORKDIR /app

COPY . .
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 && pip install --no-cache-dir -r requirements.txt

CMD gunicorn app:app & python3 main.py
RUN apt-get update && apt-get install -y ffmpeg
RUN pip install yt-dlp ffmpeg-python

