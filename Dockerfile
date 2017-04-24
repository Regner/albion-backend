
FROM debian:latest

ADD . /app/

WORKDIR /app/

RUN apt-get update -qq \
    && apt-get upgrade -y -qq \
    && apt-get install -y -qq python-dev python-pip \
    && apt-get autoremove -y \
    && apt-get clean autoclean \
    && pip install -qU pip uwsgi \
    && pip install -r requirements.txt

EXPOSE 8000

CMD ["uwsgi", "--http", "0.0.0.0:8000", "--module", "wsgi:app", "--processes", "1", "--threads", "8"]