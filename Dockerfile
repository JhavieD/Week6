FROM python:3.13-alpine

WORKDIR /code

RUN apk update \
&& apk add --virtual build-deps gcc python3-dev musl-dev \
&& apk add --no-cache mariadb-dev

RUN pip install Django mysqlclient

RUN apk del build-deps

EXPOSE 8000

COPY . .
COPY
ENTRYPOINT ["start.sh"]