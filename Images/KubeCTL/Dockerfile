FROM docker.io/library/alpine:3.14
ARG VERSION=v0.23.10
ARG TARGETARCH

RUN apk add --no-cache openssl \
  && wget -O /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/${TARGETARCH}/kubectl" \
   && chmod +x /usr/local/bin/kubectl