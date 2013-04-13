#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/config.sh
. $DIR/util.sh

pushd build
    if [ ! -d binutils ]; then
        mkdir binutils
    fi
    pushd binutils
        $DIR/tarballs/binutils-2.22/configure --target=$TARGET --prefix=$PREFIX || bail
        make || bail
        make install || bail
    popd
    export PATH=$PATH:$PREFIX/bin
    if [ ! -d gcc ]; then
        mkdir gcc
    fi
    pushd gcc
        $DIR/tarballs/gcc-4.6.0/configure --target=$TARGET --prefix=$PREFIX --disable-nls --enable-languages=c,c++ --disable-libssp --with-newlib || bail
        make all-gcc || bail
        make install-gcc || bail
        make all-target-libgcc || bail
        make install-target-libgcc || bail
    popd
    if [ ! -d newlib ]; then
        mkdir newlib
    fi
    pushd $DIR/tarballs/newlib-1.19.0/newlib/libc/sys
        autoconf || bail
        pushd toaru
            autoreconf || bail
            yasm -f elf -o crt0.o crt0.s || bail
            yasm -f elf -o crti.o crti.s || bail
            yasm -f elf -o crtn.o crtn.s || bail
            cp crt0.o ../
            cp crt0.o /tmp/__toaru_crt0.o
            cp crti.o ../
            cp crti.o /tmp/__toaru_crti.o
            cp crtn.o ../
            cp crtn.o /tmp/__toaru_crtn.o
        popd
    popd
    pushd newlib
        mkdir -p $TARGET/newlib/libc/sys
        cp /tmp/__toaru_crt0.o $TARGET/newlib/libc/sys/crt0.o
        rm /tmp/__toaru_crt0.o
        cp /tmp/__toaru_crti.o $TARGET/newlib/libc/sys/crti.o
        rm /tmp/__toaru_crti.o
        cp /tmp/__toaru_crtn.o $TARGET/newlib/libc/sys/crtn.o
        rm /tmp/__toaru_crtn.o
        echo "" > $DIR/tarballs/newlib-1.19.0/newlib/libc/stdlib/malign.c
        $DIR/tarballs/newlib-1.19.0/configure --target=$TARGET --prefix=$PREFIX || bail
        make || bail
        make install || bail
        cp -r $DIR/patches/newlib/include/* $PREFIX/$TARGET/include/
        cp $TARGET/newlib/libc/sys/crt*.o $PREFIX/$TARGET/lib/
    popd
    pushd gcc
        # build libstdc++
        make || bail
        make install || bail
    popd
    # Source the activate script, which will enable pkg-config stuff
    . $DIR/activate.sh
    if [ ! -d freetype ]; then
        mkdir freetype
    fi
    pushd freetype
        $DIR/tarballs/freetype-2.4.9/configure --host=$TARGET --prefix=$PREFIX/$TARGET || bail
        make || bail
        make install || bail
    popd
    # XXX zlib can not be built in a separate directory
    pushd $DIR/tarballs/zlib*
        CC=i686-pc-toaru-gcc ./configure --static --prefix=$PREFIX/$TARGET || bail
        make || bail
        make install || bail
    popd
    if [ ! -d libpng ]; then
        mkdir libpng
    fi
    pushd libpng
        $DIR/tarballs/libpng-1.5.13/configure --host=$TARGET --prefix=$PREFIX/$TARGET || bail
        make || bail
        make install || bail
    popd
    if [ ! -d pixman ]; then
        mkdir pixman
    fi
    pushd pixman
        $DIR/tarballs/pixman-0.26.2/configure --host=$TARGET --prefix=$PREFIX/$TARGET || bail
        make || bail
        make install || bail
    popd
    if [ ! -d cairo ]; then
        mkdir cairo
    fi
    pushd cairo
        $DIR/tarballs/cairo-1.12.2/configure --host=$TARGET --prefix=$PREFIX/$TARGET --enable-ps=no --enable-pdf=no --enable-interpreter=no || bail
        cp $DIR/patches/cairo-Makefile test/Makefile
        cp $DIR/patches/cairo-Makefile perf/Makefile
        echo -e "\n\n#define CAIRO_NO_MUTEX 1" >> config.h
        make || bail
        make install || bail
    popd
    # XXX Mesa can not be built from a separate directory (configure script doesn't provide a Makefile)
    pushd $DIR/tarballs/Mesa-*
        ./configure --enable-32-bit --host=$TARGET --prefix=$PREFIX/$TARGET  --with-osmesa-bits=8 --with-driver=osmesa --disable-egl --disable-shared --without-x --disable-glw --disable-glut --disable-driglx-direct --disable-gallium || bail
        make || bail
        make install || bail
    popd
    if [ ! -d ncurses ]; then
        mkdir ncurses
    fi
    pushd ncurses
        $DIR/tarballs/ncurses-5.9/configure --prefix=$PREFIX/$TARGET --host=$TARGET --with-terminfo-dirs=/usr/share/terminfo --with-default-terminfo-dir=/usr/share/terminfo --without-tests || bail
        make || bail
        make install || bail
    popd
    pushd $DIR/tarballs/vim73
        ac_cv_sizeof_int=4 vim_cv_getcwd_broken=no vim_cv_memmove_handles_overlap=yes vim_cv_stat_ignores_slash=no vim_cv_tgetent=zero vim_cv_terminfo=yes vim_cv_toupper_broken=no vim_cv_tty_group=world ./configure --host=$TARGET --target=$TARGET --prefix=$PREFIX/$TARGET --with-tlib=ncurses --enable-gui=no --disable-gtktest --disable-xim --with-features=normal --disable-gpm --without-x --disable-netbeans --enable-multibyte
        make || bail
        cp src/vim $DIR/../hdd/bin/vim
    popd
popd
