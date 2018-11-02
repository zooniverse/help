FROM python:3-alpine

EXPOSE 8000
WORKDIR /usr/src/help

RUN apk --no-cache add git git-fast-import

ADD requirements.txt /usr/src/help
RUN pip install -r requirements.txt

ADD . /usr/src/help