FROM docker.io/library/alpine:3.14
ARG VERSION=v1.23.10
ARG TARGETARCH

RUN apk add --no-cache openssl \
  && echo "test ${TARGETARCH}" \
  && wget -O /usr/local/bin/kubectl "https://dl.k8s.io/release/${VERSION}/bin/linux/${TARGETARCH}/kubectl" \
  && chmod +x /usr/local/bin/kubectl

ENTRYPOINT [ "/usr/local/bin/kubectl" ]