# PGPool 
```
#15 2.183 `configure' configures pgpool-II 4.5.0 to adapt to many kinds of systems.
#15 2.183 
#15 2.183 Usage: ./configure [OPTION]... [VAR=VALUE]...
#15 2.183 
#15 2.183 To assign environment variables (e.g., CC, CFLAGS...), specify them as
#15 2.183 VAR=VALUE.  See below for descriptions of some of the useful variables.
#15 2.183 
#15 2.183 Defaults for the options are specified in brackets.
#15 2.183 
#15 2.183 Configuration:
#15 2.183   -h, --help              display this help and exit
#15 2.183       --help=short        display options specific to this package
#15 2.183       --help=recursive    display the short help of all the included packages
#15 2.183   -V, --version           display version information and exit
#15 2.183   -q, --quiet, --silent   do not print `checking ...' messages
#15 2.183       --cache-file=FILE   cache test results in FILE [disabled]
#15 2.183   -C, --config-cache      alias for `--cache-file=config.cache'
#15 2.183   -n, --no-create         do not create output files
#15 2.183       --srcdir=DIR        find the sources in DIR [configure dir or `..']
#15 2.183 
#15 2.183 Installation directories:
#15 2.183   --prefix=PREFIX         install architecture-independent files in PREFIX
#15 2.183                           [/usr/local]
#15 2.183   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#15 2.183                           [PREFIX]
#15 2.183 
#15 2.183 By default, `make install' will install all the files in
#15 2.183 `/usr/local/bin', `/usr/local/lib' etc.  You can specify
#15 2.183 an installation prefix other than `/usr/local' using `--prefix',
#15 2.183 for instance `--prefix=$HOME'.
#15 2.183 
#15 2.183 For better control, use the options below.
#15 2.183 
#15 2.183 Fine tuning of the installation directories:
#15 2.183   --bindir=DIR            user executables [EPREFIX/bin]
#15 2.183   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#15 2.183   --libexecdir=DIR        program executables [EPREFIX/libexec]
#15 2.183   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#15 2.183   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#15 2.183   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#15 2.183   --libdir=DIR            object code libraries [EPREFIX/lib]
#15 2.183   --includedir=DIR        C header files [PREFIX/include]
#15 2.183   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#15 2.183   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#15 2.183   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#15 2.183   --infodir=DIR           info documentation [DATAROOTDIR/info]
#15 2.183   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#15 2.183   --mandir=DIR            man documentation [DATAROOTDIR/man]
#15 2.183   --docdir=DIR            documentation root [DATAROOTDIR/doc/pgpool-II]
#15 2.183   --htmldir=DIR           html documentation [DOCDIR]
#15 2.183   --dvidir=DIR            dvi documentation [DOCDIR]
#15 2.183   --pdfdir=DIR            pdf documentation [DOCDIR]
#15 2.183   --psdir=DIR             ps documentation [DOCDIR]
#15 2.184 
#15 2.184 Program names:
#15 2.184   --program-prefix=PREFIX            prepend PREFIX to installed program names
#15 2.184   --program-suffix=SUFFIX            append SUFFIX to installed program names
#15 2.184   --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
#15 2.184 
#15 2.184 System types:
#15 2.184   --build=BUILD     configure for building on BUILD [guessed]
#15 2.184   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#15 2.185 
#15 2.185 Optional Features:
#15 2.185   --disable-option-checking  ignore unrecognized --enable/--with options
#15 2.185   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#15 2.185   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#15 2.185   --enable-silent-rules   less verbose build output (undo: "make V=1")
#15 2.185   --disable-silent-rules  verbose build output (undo: "make V=0")
#15 2.185   --enable-maintainer-mode
#15 2.185                           enable make rules and dependencies not useful (and
#15 2.185                           sometimes confusing) to the casual installer
#15 2.185   --enable-shared[=PKGS]  build shared libraries [default=yes]
#15 2.185   --enable-static[=PKGS]  build static libraries [default=yes]
#15 2.185   --enable-fast-install[=PKGS]
#15 2.185                           optimize for fast installation [default=yes]
#15 2.185   --disable-libtool-lock  avoid locking (might break parallel builds)
#15 2.185   --disable-float4-byval  disable float4 passed by value
#15 2.185   --disable-float8-byval  disable float8 passed by value
#15 2.185   --disable-rpath     do not embed shared library search path in executables
#15 2.185   --enable-sequence-lock  insert_lock compatible with pgpool-II 3.0 series
#15 2.185                           (until 3.0.4)
#15 2.185   --enable-table-lock     insert_lock compatible with pgpool-II 2.2 and 2.3
#15 2.185                           series
#15 2.185   --enable-cassert        build with assertion checks
#15 2.185 
#15 2.185 Optional Packages:
#15 2.185   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#15 2.185   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#15 2.185   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
#15 2.185                           both]
#15 2.185   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
#15 2.185   --with-sysroot=DIR Search for dependent libraries within DIR
#15 2.185                         (or the compiler's sysroot if not specified).
#15 2.185   --with-pgsql=DIR     site header files for PostgreSQL in DIR
#15 2.185   --with-pgsql-includedir=DIR     site header files for PostgreSQL in DIR
#15 2.185   --with-pgsql-libdir=DIR     site library files for PostgreSQL in DIR
#15 2.185   --with-pgsql-bindir=DIR     site executable files for PostgreSQL in DIR
#15 2.185   --with-sunifdef=DIR     install path for sunifdef utility
#15 2.185   --with-openssl     build with OpenSSL support
#15 2.185   --with-ldap     build with LDAP support
#15 2.185   --with-pam     build with PAM support
#15 2.185   --with-memcached=DIR     site header files for libmemcached in DIR
#15 2.185 
#15 2.185 Some influential environment variables:
#15 2.185   CC          C compiler command
#15 2.185   CFLAGS      C compiler flags
#15 2.185   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#15 2.185               nonstandard directory <lib dir>
#15 2.185   LIBS        libraries to pass to the linker, e.g. -l<library>
#15 2.185   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#15 2.185               you have headers in a nonstandard directory <include dir>
#15 2.185   CPP         C preprocessor
#15 2.185   YACC        The `Yet Another Compiler Compiler' implementation to use.
#15 2.185               Defaults to the first program found out of: `bison -y', `byacc',
#15 2.185               `yacc'.
#15 2.185   YFLAGS      The list of arguments that will be passed by default to $YACC.
#15 2.185               This script will default YFLAGS to the empty string to avoid a
#15 2.185               default value of `-d' given by some make applications.
#15 2.185   DOCBOOKSTYLE
#15 2.185               location of DocBook stylesheets
#15 2.185 
#15 2.185 Use these variables to override the choices made by `configure' or to help
#15 2.185 it to find libraries and programs with nonstandard names/locations.
#15 2.185 
#15 2.185 Report bugs to <pgpool-hackers@pgpool.net>.
#15 2.186 + make
```