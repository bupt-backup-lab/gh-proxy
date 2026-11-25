FROM python:3.12-alpine

LABEL maintainer="bupt-backup-lab"

WORKDIR /app

RUN pip install --no-cache-dir flask requests gunicorn

COPY ./app /app

EXPOSE 80

CMD ["gunicorn", "--worker-class", "gthread", "--workers", "2", "--threads", "8", "--timeout", "0", "-b", "0.0.0.0:80", "main:app"]
