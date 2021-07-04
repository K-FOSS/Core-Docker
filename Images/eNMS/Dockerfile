FROM python:3-alpine as builder

RUN apk add --no-cache git gcc make bash \
    && apk add --no-cache musl-dev libffi-dev libxml2-dev libxslt-dev openssl-dev g++ rust

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