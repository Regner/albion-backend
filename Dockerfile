
FROM alpine:3.5

ADD . /app/
WORKDIR /app/

RUN apk --update add python3 python3-dev \
	&& python3 -m ensurepip \
	&& rm -r /usr/lib/python*/ensurepip \
    && pip3 install -qU pip gunicorn \
    && pip3 install -r requirements.txt \
    && rm -r /root/.cache

EXPOSE 8000

CMD ["/usr/bin/gunicorn", "wsgi:app", "-w", "3", "-b", ":8000", "--log-level", "debug"]