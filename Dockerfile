FROM python:3.10-bullseye
WORKDIR /usr/src/app

# 1) ������� ���� backend.in � "�������������" �������� ���������� � requirements.txt
COPY requirements/backend.txt .

# 2) ������������ ������
RUN pip install --no-cache-dir -r backend.txt

# 3) ������� ���� ����� ���
COPY . .

EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "spaceship.app:app"]