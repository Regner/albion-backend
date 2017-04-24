
FROM python:3.6

ADD . /app/
WORKDIR /app/

RUN apt-get update -qq \
    && apt-get upgrade -y -qq \
    && apt-get install -y -qq python-dev \
    && pip install -qU pip setuptools gunicorn \
    && pip install -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "wsgi:app", "-w", "3", "-b", ":8000", "--log-level", "debug"]