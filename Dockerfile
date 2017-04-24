
FROM python:3.6-alpine

ADD . /app/
WORKDIR /app/

RUN pip install -qU pip gunicorn \
    && pip install -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "wsgi:app", "-w", "3", "-b", ":8000", "--log-level", "debug"]