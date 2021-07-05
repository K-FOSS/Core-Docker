FROM alpine:latest as builder

RUN apk add --no-cache git gcc make bash \
    && apk add --no-cache musl-dev libxml2-dev libxslt-dev g++ rust gcc python3-dev libffi-dev openssl-dev cargo py3-pip

WORKDIR /src
RUN git clone https://github.com/afourmy/eNMS.git

WORKDIR /src/eNMS
RUN pip install --upgrade pip \
    && pip install -r build/requirements/requirements.txt 

FROM python:3-alpine
RUN apk add --no-cache git libffi-dev libxml2-dev libxslt-dev openssl-dev  ca-certificates

COPY --from=builder /usr/local/lib/python3.8 /usr/local/lib/python3.8
COPY --from=builder /src/eNMS /app
COPY --from=builder /usr/local/bin /usr/local/bin

WORKDIR /app
CMD gunicorn --config=gunicorn.py app:app