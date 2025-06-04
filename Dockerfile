FROM python:3.10-alpine

RUN apk add --no-cache gcc musl-dev libffi-dev

WORKDIR /usr/src/app

COPY requirements/backend.txt .
RUN pip install --no-cache-dir -r backend.txt

COPY . .

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "spaceship.app:app"]