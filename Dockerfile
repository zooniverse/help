FROM squidfunk/mkdocs-material

EXPOSE 8000
WORKDIR /docs

ADD . /docs