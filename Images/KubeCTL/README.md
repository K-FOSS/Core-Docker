# kubectl

Minimal Alpine image containing a version-selected [kubectl](https://kubernetes.io/docs/reference/kubectl/). The dedicated workflow publishes `kristianfjones/kubectl:v1.24.4` and `kristianfjones/kubectl:v1.23.10` for `linux/amd64` and `linux/arm64`.

The entrypoint is `kubectl`. Mount a kubeconfig or provide the usual Kubernetes environment and arguments:

```sh
docker run --rm -v "$HOME/.kube:/root/.kube:ro" kristianfjones/kubectl:v1.24.4 version --client
```

Both published versions are historical and outside the currently supported Kubernetes release window; changing the workflow matrix changes the public tags and should be handled as an explicit release decision.

Build with `docker build --build-arg VERSION=v1.24.4 -t core-docker/kubectl:local Images/KubeCTL`.
