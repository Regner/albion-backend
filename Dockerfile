
FROM alpine:3.5

ADD . /app/
WORKDIR /app/

RUN apk --update add py-gunicorn python python-dev py-pip \
    && pip install -qU gunicorn \
    && pip install -r requirements.txt

EXPOSE 8000

CMD ["/usr/bin/gunicorn", "wsgi:app", "-w", "3", "-b", ":8000", "--log-level", "debug"]