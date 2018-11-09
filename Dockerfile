FROM python:3-alpine

EXPOSE 8000
WORKDIR /usr/src/help

RUN apk --no-cache add git git-fast-import openssh-client

RUN echo "Host *" >> /etc/ssh/ssh_config &&\
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD requirements.txt /usr/src/help
RUN pip install -r requirements.txt

ADD . /usr/src/help