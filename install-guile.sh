#!/bin/bash

GUILE_VERSION=3.0.0
DEP_PKGS=(
    gmp-devel.x86_64
    libtool-ltdl-devel.x86_64
    libunistring-devel.x86_64
    libffi-devel.x86_64
    readline-devel.x86_64
    pkgconfig-0.27.1-4.el7.x86_64
    texinfo.x86_64
)

BDW_GC=(
    https://www.hboehm.info/gc/gc_source/gc-7.6.10.tar.gz
    https://www.hboehm.info/gc/gc_source/libatomic_ops-7.6.10.tar.gz
)

function install-gc() {
    wget ${BDW_GC}
    zcat gc-7.6.10.tar.gz | tar xvf -
    cd gc-7.6.10/
    zcat ../libatomic_ops-7.6.10.tar.gz | tar xvf -
    mv libatomic_ops-7.6.10/ libatomic_ops
    ./configure 
    make
    sudo make install
    cd ..
}

sudo yum -y install ${DEP_PKGS[@]}

PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH
pkg-config bdw-gc
if [[ ! $? ]]
then
    install-gc
fi

if [[ ! -f guile-${GUILE_VERSION} ]]
then
    wget ftp://ftp.gnu.org/gnu/guile/guile-${GUILE_VERSION}.tar.gz
    zcat guile-${GUILE_VERSION}.tar.gz | tar xvf -
fi
cd guile-${GUILE_VERSION}
./configure
make
sudo make install

