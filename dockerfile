FROM python:3-alpine
LABEL mantainer="mikeleg" 
WORKDIR /code
COPY . /code/
RUN apk add --update --no-cache --virtual .build-deps \
              gcc libc-dev linux-headers py3-setuptools && \
    rm -rf /var/cache/apk/* && \
    pip3 install -r requirements.txt --no-cache-dir &&\
    apk del .build-deps
EXPOSE 8000