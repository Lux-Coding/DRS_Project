# poky commit 179c5cb7fd0f06970135187f1203507aa55d6bde introduced sdk build errors
# see also https://lists.yoctoproject.org/pipermail/yocto/2019-March/044575.html
DUMMYPROVIDES = "\
    /bin/sh \
    /bin/bash \
    /usr/bin/env \
    /usr/bin/perl \
    pkgconfig \
"