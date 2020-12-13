FROM python:3.8.5

WORKDIR /code

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

RUN pip install --upgrade pip

COPY . .

RUN pip install -r requirements.txt && python3 manage.py collectstatic --noinput

CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000