# FreeSwitch

```
#17 28.85 autoreconf: Leaving directory '.'
#17 28.92 `configure' configures freeswitch 1.10.11-release to adapt to many kinds of systems.
#17 28.92 
#17 28.92 Usage: ./configure [OPTION]... [VAR=VALUE]...
#17 28.92 
#17 28.92 To assign environment variables (e.g., CC, CFLAGS...), specify them as
#17 28.92 VAR=VALUE.  See below for descriptions of some of the useful variables.
#17 28.92 
#17 28.92 Defaults for the options are specified in brackets.
#17 28.92 
#17 28.92 Configuration:
#17 28.92   -h, --help              display this help and exit
#17 28.92       --help=short        display options specific to this package
#17 28.92       --help=recursive    display the short help of all the included packages
#17 28.92   -V, --version           display version information and exit
#17 28.92   -q, --quiet, --silent   do not print `checking ...' messages
#17 28.92       --cache-file=FILE   cache test results in FILE [disabled]
#17 28.92   -C, --config-cache      alias for `--cache-file=config.cache'
#17 28.92   -n, --no-create         do not create output files
#17 28.92       --srcdir=DIR        find the sources in DIR [configure dir or `..']
#17 28.92 
#17 28.92 Installation directories:
#17 28.92   --prefix=PREFIX         install architecture-independent files in PREFIX
#17 28.92                           [/usr/local/freeswitch]
#17 28.92   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#17 28.92                           [PREFIX]
#17 28.92 
#17 28.92 By default, `make install' will install all the files in
#17 28.92 `/usr/local/freeswitch/bin', `/usr/local/freeswitch/lib' etc.  You can specify
#17 28.92 an installation prefix other than `/usr/local/freeswitch' using `--prefix',
#17 28.92 for instance `--prefix=$HOME'.
#17 28.92 
#17 28.92 For better control, use the options below.
#17 28.92 
#17 28.92 Fine tuning of the installation directories:
#17 28.92   --bindir=DIR            user executables [EPREFIX/bin]
#17 28.92   --sbindir=DIR           system admin executables [EPREFIX/sbin]
#17 28.92   --libexecdir=DIR        program executables [EPREFIX/libexec]
#17 28.92   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#17 28.92   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#17 28.92   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#17 28.92   --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
#17 28.92   --libdir=DIR            object code libraries [EPREFIX/lib]
#17 28.92   --includedir=DIR        C header files [PREFIX/include]
#17 28.92   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#17 28.92   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
#17 28.92   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#17 28.92   --infodir=DIR           info documentation [DATAROOTDIR/info]
#17 28.92   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
#17 28.92   --mandir=DIR            man documentation [DATAROOTDIR/man]
#17 28.92   --docdir=DIR            documentation root [DATAROOTDIR/doc/freeswitch]
#17 28.92   --htmldir=DIR           html documentation [DOCDIR]
#17 28.92   --dvidir=DIR            dvi documentation [DOCDIR]
#17 28.92   --pdfdir=DIR            pdf documentation [DOCDIR]
#17 28.92   --psdir=DIR             ps documentation [DOCDIR]
#17 28.92 
#17 28.92 Program names:
#17 28.92   --program-prefix=PREFIX            prepend PREFIX to installed program names
#17 28.92   --program-suffix=SUFFIX            append SUFFIX to installed program names
#17 28.92   --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
#17 28.92 
#17 28.92 System types:
#17 28.92   --build=BUILD     configure for building on BUILD [guessed]
#17 28.92   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
#17 28.92 
#17 28.92 Optional Features:
#17 28.92   --disable-option-checking  ignore unrecognized --enable/--with options
#17 28.92   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#17 28.92   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#17 28.92   --enable-silent-rules   less verbose build output (undo: "make V=1")
#17 28.92   --disable-silent-rules  verbose build output (undo: "make V=0")
#17 28.92   --enable-64             build with 64 bit support
#17 28.92   --enable-dependency-tracking
#17 28.92                           do not reject slow dependency extractors
#17 28.92   --disable-dependency-tracking
#17 28.92                           speeds up one-time build
#17 28.92   --disable-fhs           Do Not follow the FHS when placing files and
#17 28.92                           directories (default only when not specifying prefix
#17 28.92   --enable-static[=PKGS]  build static libraries [default=no]
#17 28.92   --enable-shared[=PKGS]  build shared libraries [default=yes]
#17 28.92   --enable-fast-install[=PKGS]
#17 28.92                           optimize for fast installation [default=yes]
#17 28.92   --disable-libtool-lock  avoid locking (might break parallel builds)
#17 28.92   --enable-optimization   Set if you want us to add max optimising compiler
#17 28.92                           flags
#17 28.92   --enable-portable-binary
#17 28.92                           disable compiler optimizations that would produce
#17 28.92                           unportable binaries
#17 28.92   --disable-visibility    Disable or enable API visibility support (default:
#17 28.92                           use if available)
#17 28.92   --disable-debug         build without debug information
#17 28.92   --disable-libyuv        build without libyuv
#17 28.92   --disable-libvpx        build without libvpx
#17 28.92   --disable-cpp           build without cpp code
#17 28.92   --enable-system-xmlrpc-c
#17 28.92                           use system lib for xmlrpc-c
#17 28.92   --disable-srtp          build without srtp support
#17 28.92   --enable-core-odbc-support
#17 28.92                           Compile with ODBC Support (default is optional)
#17 28.92   --disable-core-pgsql-pkgconfig
#17 28.92                           Use pg_config to get PGQSL build options
#17 28.92   --enable-deprecated-core-db-events
#17 28.92                           Keep deprecated core db events
#17 28.92   --disable-core-libedit-support
#17 28.92                           Compile without libedit Support
#17 28.92   --enable-systemd        Compile with systemd notify support
#17 28.92   --enable-address-sanitizer
#17 28.92                           build with address sanitizer
#17 28.92   --enable-heap-profiler  build with google heap profiler
#17 28.92   --enable-cpu-profiler   build with google cpu profiler
#17 28.92   --enable-fake-dlclose   Do not unload dynamic libraries
#17 28.92   --enable-pool-sanitizer build with sanitizer friendly pool behavior
#17 28.92 
#17 28.92 Optional Packages:
#17 28.92   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#17 28.92   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#17 28.92   --with-modinstdir=DIR   Install modules into this location (default:
#17 28.92                           $prefix/mod)
#17 28.92   --with-rundir=DIR       Put pidfile into this location (default:
#17 28.92                           $prefix/run)
#17 28.92   --with-logfiledir=DIR   Put logfiles into this location (default:
#17 28.92                           $localstatedir/log)
#17 28.92   --with-dbdir=DIR        Put database files into this location (default:
#17 28.92                           $prefix/db)
#17 28.92   --with-htdocsdir=DIR    Put html files into this location (default:
#17 28.92                           $prefix/htdocs)
#17 28.92   --with-fontsdir=DIR     Put font files into this location (default:
#17 28.92                           $prefix/fonts)
#17 28.92   --with-soundsdir=DIR    Put sound files into this location (default:
#17 28.92                           $prefix/sounds)
#17 28.92   --with-grammardir=DIR   Put grammar files into this location (default:
#17 28.92                           $prefix/grammar)
#17 28.92   --with-certsdir=DIR     Put certs files into this location (default:
#17 28.92                           $prefix/certs)
#17 28.92   --with-scriptdir=DIR    Put script files into this location (default:
#17 28.92                           $prefix/scripts)
#17 28.92   --with-recordingsdir=DIR
#17 28.92                           Put recordings files into this location (default:
#17 28.92                           $prefix/recordings)
#17 28.92   --with-imagesdir=DIR    Put images files into this location (default:
#17 28.92                           $prefix/images)
#17 28.92   --with-storagedir=DIR   Put storage files into this location (default:
#17 28.92                           $prefix/storage)
#17 28.92   --with-cachedir=DIR     Put cache files into this location (default:
#17 28.92                           $prefix/cache)
#17 28.92   --with-pkgconfigdir=DIR Installation directory for pkgconfig file (default:
#17 28.92                           ${libdir}/pkgconfig)
#17 28.92   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
#17 28.92                           both]
#17 28.92   --with-aix-soname=aix|svr4|both
#17 28.92                           shared library versioning (aka "SONAME") variant to
#17 28.92                           provide on AIX, [default=aix].
#17 28.92   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
#17 28.92   --with-sysroot[=DIR]    Search for dependent libraries within DIR (or the
#17 28.92                           compiler's sysroot if not specified).
#17 28.92   --with-gcc-arch=<arch>  use architecture <arch> for gcc -march/-mtune,
#17 28.92                           instead of guessing
#17 28.92   --with-lib-subdir=DIR   Find libraries in DIR instead of lib
#17 28.92   --with-odbc=PREFIX      Compile with ODBC support
#17 28.92   --with-odbc-lib=dir     use odbc libraries in dir
#17 28.92   --with-odbc-include=dir use odbc headers in dir
#17 28.92   --without-png           disable support for libpng
#17 28.92   --without-freetype      disable support for freetype
#17 28.92   --with-openssl          use OpenSSL [enabled]
#17 28.92   --with-java=PFX         prefix where 'java' is installed.
#17 28.92   --with-python           Use system provided version of python (default: try)
#17 28.92   --with-python3          Use system provided version of python3 (default:
#17 28.92                           try)
#17 28.92   --with-erlang           Use system provided version of erlang (default: try)
#17 28.92 
#17 28.92 Some influential environment variables:
#17 28.92   CC          C compiler command
#17 28.92   CFLAGS      C compiler flags
#17 28.92   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
#17 28.92               nonstandard directory <lib dir>
#17 28.92   LIBS        libraries to pass to the linker, e.g. -l<library>
#17 28.92   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
#17 28.92               you have headers in a nonstandard directory <include dir>
#17 28.92   CXX         C++ compiler command
#17 28.92   CXXFLAGS    C++ compiler flags
#17 28.92   LT_SYS_LIBRARY_PATH
#17 28.92               User-defined run-time library search path.
#17 28.92   CXXCPP      C++ preprocessor
#17 28.92   CPP         C preprocessor
#17 28.92 
#17 28.92 Use these variables to override the choices made by `configure' or to help
#17 28.92 it to find libraries and programs with nonstandard names/locations.
#17 28.92 
#17 28.92 Report bugs to <bugs@freeswitch.org>.
#17 28.92 make: *** No rule to make target 'libs/libvpx/libvpx.a'.  Stop.
```