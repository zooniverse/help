FROM python:3-alpine

WORKDIR /usr/src/help

RUN apk --no-cache add git

ADD requirements.txt /usr/src/help
RUN pip install -r requirements.txt

ADD . /usr/src/help