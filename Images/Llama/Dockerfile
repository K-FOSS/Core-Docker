FROM debian:bookworm AS build
RUN apt-get update && apt-get install -y git cmake build-essential libnuma-dev curl libcurl4-openssl-dev
RUN git clone --depth=1 https://github.com/ggml-org/llama.cpp /src
WORKDIR /src
# AVX only; disable AVX2/FMA/F16C; enable RPC + NUMA; DO NOT use -march=native
RUN cmake -B build -DCMAKE_BUILD_TYPE=Release \
  -DGGML_RPC=ON -DLLAMA_NUMA=ON \
  -DLLAMA_AVX=ON -DLLAMA_AVX2=OFF -DLLAMA_FMA=OFF -DLLAMA_F16C=OFF
RUN cmake --build build -j

FROM debian:bookworm-slim
COPY --from=build /src/build/bin/rpc-server /usr/local/bin/
ENTRYPOINT ["rpc-server"]