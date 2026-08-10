# UPnP client tools

Minimal Alpine image containing [`miniupnpc`](https://miniupnp.tuxfamily.org/). CI publishes `kristianfjones/upnp:jobs` for `linux/amd64`.

There is no default entrypoint or command; invoke the required tool explicitly. Host networking is commonly necessary for SSDP discovery, subject to your deployment's security policy:

```sh
docker run --rm --network host kristianfjones/upnp:jobs upnpc -l
```

Build locally with `docker build -t core-docker/upnp:local Images/UPNP`.
