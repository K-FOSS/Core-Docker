# OpenLDAP

```
#13 0.100 `configure' configures this package to adapt to many kinds of systems.
#13 0.100 
#13 0.100 Usage: ./configure [OPTION]... [VAR=VALUE]...
#13 0.100 
#13 0.100 To assign environment variables (e.g., CC, CFLAGS...), specify them as
#13 0.100 VAR=VALUE.  See below for descriptions of some of the useful variables.
#13 0.100 
#13 0.100 Defaults for the options are specified in brackets.
#13 0.100 
#13 0.100 Configuration:
#13 0.100   -h, --help              display this help and exit
#13 0.100       --help=short        display options specific to this package
#13 0.100       --help=recursive    display the short help of all the included packages
#13 0.100   -V, --version           display version information and exit
#13 0.100   -q, --quiet, --silent   do not print `checking ...' messages
#13 0.100       --cache-file=FILE   cache test results in FILE [disabled]
#13 0.100   -C, --config-cache      alias for `--cache-file=config.cache'
#13 0.100   -n, --no-create         do not create output files
#13 0.100       --srcdir=DIR        find the sources in DIR [configure dir or `..']
#13 0.100 
#13 0.100 Installation directories:
#13 0.100   --prefix=PREFIX         install architecture-independent files in PREFIX
#13 0.100                           [/usr/local]
#13 0.100   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#13 0.100                           [PREFIX]
#13 0.100 
#13 0.100 By default, `make install' will install all the files in
#13 0.100 `/usr/local/bin', `/usr/local/lib' etc.  You can specify
#13 0.100 an installation prefix other than `/usr/local' using `--prefix',
#13 0.100 for instance `--prefix=$HOME'.
#13 0.100 
#13 0.100 For better control, use the options below.
#13 0.100 
#13 0.100 Fine tuning of the installation directories:
#13 0.100   --bindir=DIR            user executables [EPREFIX/bin]
#13 0.100   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#13 0.100   --libexecdir=DIR        program executables [EPREFIX/libexec]
#13 0.100   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#13 0.100   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#13 0.100   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#13 0.100   --libdir=DIR            object code libraries [EPREFIX/lib]
#13 0.100   --includedir=DIR        C header files [PREFIX/include]
#13 0.100   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#13 0.100   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#13 0.100   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#13 0.100   --infodir=DIR           info documentation [DATAROOTDIR/info]
#13 0.100   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#13 0.100   --mandir=DIR            man documentation [DATAROOTDIR/man]
#13 0.100   --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
#13 0.100   --htmldir=DIR           html documentation [DOCDIR]
#13 0.100   --dvidir=DIR            dvi documentation [DOCDIR]
#13 0.100   --pdfdir=DIR            pdf documentation [DOCDIR]
#13 0.100   --psdir=DIR             ps documentation [DOCDIR]
#13 0.102 
#13 0.102 System types:
#13 0.102   --build=BUILD     configure for building on BUILD [guessed]
#13 0.102   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#13 0.102   --target=TARGET   configure for building compilers for TARGET [HOST]
#13 0.103 
#13 0.103 Optional Features:
#13 0.103   --disable-option-checking  ignore unrecognized --enable/--with options
#13 0.103   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#13 0.103   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#13 0.103   --enable-debug          enable debugging no|yes|traditional [yes]
#13 0.103   --enable-dynamic        enable linking built binaries with dynamic libs [auto]
#13 0.103   --enable-syslog         enable syslog support [auto]
#13 0.103   --enable-ipv6           enable IPv6 support [auto]
#13 0.103   --enable-local          enable AF_LOCAL (AF_UNIX) socket support [auto]
#13 0.103 
#13 0.103 SLAPD (Standalone LDAP Daemon) Options:
#13 0.103   --enable-slapd          enable building slapd [yes]
#13 0.103   --enable-dynacl         enable run-time loadable ACL support (experimental) [no]
#13 0.103   --enable-aci            enable per-object ACIs (experimental) no|yes|mod [no]
#13 0.103   --enable-cleartext      enable cleartext passwords [yes]
#13 0.103   --enable-crypt          enable crypt(3) passwords [no]
#13 0.103   --enable-spasswd        enable (Cyrus) SASL password verification [no]
#13 0.103   --enable-modules        enable dynamic module support [no]
#13 0.103   --enable-rlookups       enable reverse lookups of client hostnames [no]
#13 0.103   --enable-slapi          enable SLAPI support (experimental) [no]
#13 0.103   --enable-slp            enable SLPv2 support [no]
#13 0.103   --enable-wrappers       enable tcp wrapper support [no]
#13 0.103 
#13 0.103 SLAPD Backend Options:
#13 0.103   --enable-backends       enable all available backends no|yes|mod
#13 0.103   --enable-dnssrv         enable dnssrv backend no|yes|mod [no]
#13 0.103   --enable-ldap           enable ldap backend no|yes|mod [no]
#13 0.103   --enable-mdb            enable mdb database backend no|yes|mod [yes]
#13 0.103   --enable-meta           enable metadirectory backend no|yes|mod [no]
#13 0.103   --enable-asyncmeta      enable asynchronous metadirectory backend no|yes|mod [no]
#13 0.103   --enable-null           enable null backend no|yes|mod [no]
#13 0.103   --enable-passwd         enable passwd backend no|yes|mod [no]
#13 0.103   --enable-perl           enable perl backend no|yes|mod [no]
#13 0.103   --enable-relay          enable relay backend no|yes|mod [yes]
#13 0.103   --enable-sock           enable sock backend no|yes|mod [no]
#13 0.103   --enable-sql            enable sql backend no|yes|mod [no]
#13 0.103   --enable-wt             enable WiredTiger backend no|yes|mod [no]
#13 0.103 
#13 0.103 SLAPD Overlay Options:
#13 0.103   --enable-overlays       enable all available overlays no|yes|mod
#13 0.103   --enable-accesslog      In-Directory Access Logging overlay no|yes|mod [no]
#13 0.103   --enable-auditlog       Audit Logging overlay no|yes|mod [no]
#13 0.103   --enable-autoca         Automatic Certificate Authority overlay no|yes|mod [no]
#13 0.103   --enable-collect        Collect overlay no|yes|mod [no]
#13 0.103   --enable-constraint     Attribute Constraint overlay no|yes|mod [no]
#13 0.103   --enable-dds            Dynamic Directory Services overlay no|yes|mod [no]
#13 0.103   --enable-deref          Dereference overlay no|yes|mod [no]
#13 0.103   --enable-dyngroup       Dynamic Group overlay no|yes|mod [no]
#13 0.103   --enable-dynlist        Dynamic List overlay no|yes|mod [no]
#13 0.103   --enable-homedir        Home Directory Management overlay no|yes|mod [no]
#13 0.103   --enable-memberof       Reverse Group Membership overlay no|yes|mod [no]
#13 0.103   --enable-otp            OTP 2-factor authentication overlay no|yes|mod [no]
#13 0.103   --enable-ppolicy        Password Policy overlay no|yes|mod [no]
#13 0.103   --enable-proxycache     Proxy Cache overlay no|yes|mod [no]
#13 0.103   --enable-refint         Referential Integrity overlay no|yes|mod [no]
#13 0.103   --enable-remoteauth     Deferred Authentication overlay no|yes|mod [no]
#13 0.103   --enable-retcode        Return Code testing overlay no|yes|mod [no]
#13 0.103   --enable-rwm            Rewrite/Remap overlay no|yes|mod [no]
#13 0.103   --enable-seqmod         Sequential Modify overlay no|yes|mod [no]
#13 0.103   --enable-sssvlv         ServerSideSort/VLV overlay no|yes|mod [no]
#13 0.103   --enable-syncprov       Syncrepl Provider overlay no|yes|mod [yes]
#13 0.103   --enable-translucent    Translucent Proxy overlay no|yes|mod [no]
#13 0.103   --enable-unique         Attribute Uniqueness overlay no|yes|mod [no]
#13 0.103   --enable-valsort        Value Sorting overlay no|yes|mod [no]
#13 0.103 
#13 0.103 SLAPD Password Module Options:
#13 0.103   --enable-argon2         Argon2 password hashing module no|yes [no]
#13 0.103 
#13 0.103 LLOADD (Load Balancer Daemon) Options:
#13 0.103   --enable-balancer       enable load balancer no|yes|mod [no]
#13 0.103 
#13 0.103 Library Generation & Linking Options
#13 0.103   --enable-static[=PKGS]  build static libraries [default=yes]
#13 0.103   --enable-shared[=PKGS]  build shared libraries [default=yes]
#13 0.103   --enable-versioning     Enable versioned symbols in shared library no|yes|auto [auto]
#13 0.103   --enable-fast-install[=PKGS]
#13 0.103                           optimize for fast installation [default=yes]
#13 0.103   --disable-libtool-lock  avoid locking (might break parallel builds)
#13 0.103 
#13 0.103 Optional Packages:
#13 0.103   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#13 0.103   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#13 0.103   --with-subdir=DIR       change default subdirectory used for installs
#13 0.103   --with-cyrus-sasl       with Cyrus SASL support [auto]
#13 0.103   --with-systemd          with systemd service notification support [auto]
#13 0.103   --with-fetch            with fetch(3) URL support [auto]
#13 0.103   --with-threads          with threads library auto|nt|posix|pth|lwp|manual [auto]
#13 0.103   --with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
#13 0.103   --with-yielding-select  with implicitly yielding select [auto]
#13 0.103   --with-mp               with multiple precision statistics
#13 0.103                           auto|longlong|long|bignum|gmp [auto]
#13 0.103   --with-odbc             with specific ODBC support
#13 0.103                           iodbc|unixodbc|odbc32|auto [auto]
#13 0.103   --with-argon2           with argon2 support library auto|libsodium|libargon2 [auto]
#13 0.103   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
#13 0.103                           both]
#13 0.103   --with-aix-soname=aix|svr4|both
#13 0.103                           shared library versioning (aka "SONAME") variant to
#13 0.103                           provide on AIX, [default=aix].
#13 0.103   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
#13 0.103   --with-sysroot[=DIR]    Search for dependent libraries within DIR (or the
#13 0.103                           compiler's sysroot if not specified).
#13 0.103 
#13 0.103 See INSTALL file for further details.
#13 0.103 
#13 0.103 Some influential environment variables:
#13 0.103   CC          C compiler command
#13 0.103   CFLAGS      C compiler flags
#13 0.103   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#13 0.103               nonstandard directory <lib dir>
#13 0.103   LIBS        libraries to pass to the linker, e.g. -l<library>
#13 0.103   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#13 0.103               you have headers in a nonstandard directory <include dir>
#13 0.103   LT_SYS_LIBRARY_PATH
#13 0.103               User-defined run-time library search path.
#13 0.103   CPP         C preprocessor
#13 0.103   PKG_CONFIG  path to pkg-config utility
#13 0.103   PKG_CONFIG_PATH
#13 0.103               directories to add to pkg-config's search path
#13 0.103   PKG_CONFIG_LIBDIR
#13 0.103               path overriding pkg-config's built-in search path
#13 0.103   WT_CFLAGS   C compiler flags for WT, overriding pkg-config
#13 0.103   WT_LIBS     linker flags for WT, overriding pkg-config
#13 0.103   systemdsystemunitdir
#13 0.103               value of systemdsystemunitdir for systemd, overriding pkg-config
#13 0.103 
#13 0.103 Use these variables to override the choices made by `configure' or to help
#13 0.103 it to find libraries and programs with nonstandard names/locations.
#13 0.103 
#13 0.103 Report bugs to the package provider.
#13 DONE 0.1s
```