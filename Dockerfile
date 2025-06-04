FROM python:3.10-bullseye
WORKDIR /usr/src/app

# 1) Копіюємо файл backend.in і "перейменовуємо" всередині контейнера у requirements.txt
COPY requirements/backend.txt .

# 2) Встановлюємо пакети
RUN pip install --no-cache-dir -r backend.txt

# 3) Копіюємо весь інший код
COPY . .

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "spaceship.app:app"]