FROM python:3.10.7-alpine as builder

WORKDIR /app

ENV HTML_PATH /tmp/html
RUN mkdir $HTML_PATH

ARG POETRY_VERSION=1.0.5
ENV POETRY_HOME=/poetry
ADD https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py .
RUN python get-poetry.py --version $POETRY_VERSION -y

COPY pyproject.toml ./
COPY poetry* ./
RUN /poetry/bin/poetry install

COPY . .
RUN /poetry/bin/poetry run sphinx-build -M html source build \
      && mv build/html/ ${HTML_PATH}/en
RUN /poetry/bin/poetry run sphinx-build -M html source build -D language=ja \
      && mv build/html/ ${HTML_PATH}/ja


FROM nginx:1.15.12-alpine

ENV HTML_PATH /tmp/html

COPY --from=builder /app/.docker/nginx/redirect_by_lang.conf /etc/nginx/conf.d/default.conf
COPY --from=builder ${HTML_PATH} /usr/share/nginx/html/
