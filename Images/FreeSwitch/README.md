# FreeSWITCH

This directory contains a legacy Alpine-based build of
[FreeSWITCH](https://github.com/signalwire/freeswitch). It compiles a broad
module selection from source, installs the sample configuration and web files,
and creates a runtime image that runs as the unprivileged `freeswitch` user
with UID and GID 1000.

The image is not currently built or published by the repository's active
GitHub Actions workflows. The corresponding step in
`.github/workflows/Daily.yaml` is commented out, so treat this as a local build
context rather than a supported registry image.

## Build

Build the context locally from the repository root:

```sh
docker build --pull --tag core-docker/freeswitch:local Images/FreeSwitch
```

The Dockerfile currently discovers a release from the upstream download index
and uses mutable `alpine:latest` stages. Reproducibility is therefore not
guaranteed. The previous captured build stopped while requesting
`libs/libvpx/libvpx.a`; see [CONFIGURE_FLAGS.md](CONFIGURE_FLAGS.md) for that
historical output and [modules.conf](modules.conf) for the selected modules.

The build accepts these arguments while creating the runtime account:

| Argument | Default | Purpose |
| --- | --- | --- |
| `USER` | `freeswitch` | Runtime account name |
| `UID` | `1000` | Runtime UID and GID |
| `USER_DATA` | `/etc/freeswitch` | Account home directory |

Keep the defaults for the current Dockerfile: the final stage selects
`USER freeswitch` and assigns runtime-directory ownership to UID/GID 1000
literally, so changing `USER` or `UID` alone produces an inconsistent image.

The configure options actually used by this image are maintained in the
[Dockerfile](Dockerfile). They install FreeSWITCH into standard filesystem
paths, enable PostgreSQL core support, LDAP, system Lua, and system XML-RPC,
and disable debug information and core libedit support.

## Runtime

The image entrypoint starts FreeSWITCH with:

```text
freeswitch -nonat -nocal -nort -nosql -nf -c
```

It does not forward additional command-line arguments. On `SIGTERM`, the
entrypoint asks FreeSWITCH to stop and waits for the server process to exit.
There is no Docker health check and the Dockerfile does not declare ports.
Expose only the SIP, event-socket, WebRTC, and RTP ports required by your own
FreeSWITCH configuration; consult the upstream
[FreeSWITCH documentation](https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/)
before making any service reachable outside a trusted network.

The sample configuration is installed under `/etc/freeswitch`. For persistent
operation, provide deployment-specific configuration and writable state for
the paths your configuration uses, commonly:

- `/etc/freeswitch` for configuration and scripts
- `/var/lib/freeswitch` for recordings, storage, and other runtime data
- `/var/log/freeswitch` for logs

Those paths are owned by UID/GID 1000 in the image. Do not put passwords or
tokens into the image build context; provide secrets at runtime using the
deployment platform's secret mechanism.

A minimal smoke test after a successful build is:

```sh
docker run --rm core-docker/freeswitch:local
```

Use a deployment-specific configuration and explicit port mappings for any
functional SIP or media test.
