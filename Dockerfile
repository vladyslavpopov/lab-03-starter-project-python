FROM python:3.10-bullseye
WORKDIR /usr/src/app

COPY . .

COPY requirements/backend.txt .

RUN pip install --no-cache-dir -r backend.txt

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "spaceship.app:app"]