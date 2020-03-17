FROM python:3.7.3-alpine as builder

WORKDIR /app

ENV HTML_PATH /tmp/html
RUN mkdir $HTML_PATH

RUN pip install pipenv

COPY Pipfile* ./
RUN pipenv sync

COPY . .
RUN pipenv run build \
      && mv build/html/ ${HTML_PATH}/en
RUN pipenv run build_ja \
      && mv build/html/ ${HTML_PATH}/ja


FROM nginx:1.15.12-alpine

ENV HTML_PATH /tmp/html

COPY --from=builder /app/.docker/nginx/redirect_by_lang.conf /etc/nginx/conf.d/default.conf
COPY --from=builder ${HTML_PATH} /usr/share/nginx/html/
