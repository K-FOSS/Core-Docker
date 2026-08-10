# llama.cpp RPC server

CPU-oriented [llama.cpp](https://github.com/ggml-org/llama.cpp) build with RPC enabled. CI publishes `kristianfoss/llama:core` for `linux/amd64`.

The default entrypoint is `/app/rpc-server`; `llama-cli`, `llama-embedding`, and `llama-server` are also installed. Put model files under `/app/models` when using the bundled tools. The default build follows llama.cpp's `master` branch; use `LLAMACPP_VERSION` to select a tag or commit for a reproducible local build.

```sh
docker build --build-arg LLAMACPP_VERSION=<tag-or-commit> -t core-docker/llama:local Images/Llama
```
