# OpenLDAP

Minimal scratch image containing a source-built [OpenLDAP](https://www.openldap.org/) installation. The build selects the newest release listed by upstream at build time. CI publishes `kristianfjones/library-openldap:latest` for `linux/amd64`.

This image has no shell, package manager, entrypoint, default command, or bundled service configuration. Run the required OpenLDAP binary explicitly and mount configuration and writable data paths appropriate to your deployment. Consult the [OpenLDAP Administrator's Guide](https://www.openldap.org/doc/admin26/) before deploying it.

Build locally with `docker build -t core-docker/openldap:local Images/LDAP`.
