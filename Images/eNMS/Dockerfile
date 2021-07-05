FROM alpine:latest as builder
RUN apk add --no-cache git gcc make bash \
    && apk add --no-cache musl-dev libxml2-dev libxslt-dev g++ rust gcc python3-dev libffi-dev openssl-dev cargo py3-pip


WORKDIR /src
RUN git clone https://github.com/afourmy/eNMS.git


WORKDIR /src/eNMS
RUN pip install --upgrade pip \
    && pip install -r build/requirements/requirements.txt \
    && pip install -r build/requirements/requirements_optional.txt




FROM alpine:latest
RUN apk add --no-cache python3 git libffi libxml2 libxslt openssl ca-certificates openssh


COPY --from=builder /usr/bin/flask /usr/bin/flask
COPY --from=builder /usr/lib/python3.9 /usr/lib/python3.9
COPY --from=builder /src/eNMS /app
COPY --from=builder /usr/local/bin /usr/local/bin


WORKDIR /app
ENV FLASK_APP=app.py


ENTRYPOINT [ "/usr/bin/flask" ]
CMD ["run", "--host=0.0.0.0"]