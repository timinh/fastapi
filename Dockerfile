ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}

ARG ARG_TIMEZONE=Europe/Paris
ENV TZ=${ARG_TIMEZONE}

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["fastapi", "run", "app/main.py", "--port", "80"]