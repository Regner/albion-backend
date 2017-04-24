
FROM alpine:3.5

ADD . /app/
WORKDIR /app/

RUN apk --update add python python-dev py-pip build-base \
    && pip install -qU pip gunicorn \
    && pip install -r requirements.txt

EXPOSE 8000

CMD ["/usr/bin/gunicorn", "wsgi:app", "-w", "3", "-b", ":8000", "--log-level", "debug"]