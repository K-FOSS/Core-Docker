FROM ubuntu:24.04 AS builder
WORKDIR /app

ARG LLAMACPP_REPO="https://github.com/ggerganov/llama.cpp.git"
# It may be name of branch, tag or commit hash
ARG LLAMACPP_VERSION="master"

# To get latest tag use this:
# git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
#    "https://github.com/ggerganov/llama.cpp.git" 'b*' | \
#    tail --lines=1 | cut --delimiter='/' --fields=3
# For details see here: https://stackoverflow.com/questions/8932389/git-shallow-clone-to-specific-tag)

# Install dependencies
RUN set -xe \
 && apt update -q \
 && apt install -fyq bash wget git cmake make g++ curl libcurl4-openssl-dev \
 && apt clean

# Clone repo
RUN set -xe \
 && git clone --branch "$LLAMACPP_VERSION" --depth 1 "$LLAMACPP_REPO"

# Build binaries
WORKDIR /app/llama.cpp
RUN set -xe \
 && cmake -B build -DGGML_RPC=ON -DCMAKE_BUILD_RPATH_USE_ORIGIN=ON -DLLAMA_NUMA=ON -DLLAMA_AVX=ON -DGGML_AVX2=OFF -DLLAMA_FMA=OFF -DLLAMA_F16C=OFF \
 && cmake --build build --config Release -j$(nproc)


FROM ubuntu:24.04
WORKDIR /app

# Install basic dependencies
RUN set -xe \
 && apt update -q \
 && apt install -fyq libgomp1 curl \
 && apt clean

# Create folders
RUN set -xe \
 && mkdir -pv /app/models

# Copy compiled tools
COPY --from=builder /app/llama.cpp/build/bin/*.so /usr/lib/x86_64-linux-gnu
COPY --from=builder /app/llama.cpp/build/bin/rpc-server .
COPY --from=builder /app/llama.cpp/build/bin/llama-cli .
COPY --from=builder /app/llama.cpp/build/bin/llama-embedding .
COPY --from=builder /app/llama.cpp/build/bin/llama-server .

ENTRYPOINT ["/app/rpc-server"]