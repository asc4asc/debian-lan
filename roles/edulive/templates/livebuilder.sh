#!/usr/bin/bash
#
# build live images and copy kernel, initramfs and squashfs
#

set -eu

BUILDD="{{ build_dir }}"

run_build(){
    local DEST="/var/lib/tftpboot/d-i/n-live/$1/live/"
    cd "$BUILDD/$1"
    [[ -d "$DEST" ]] || mkdir -vp "$DEST"

    lb clean && lb config && lb build

    for FILE in vmlinuz initrd.img filesystem.squashfs ; do
        ln -vf "$BUILDD/$1/binary/live/$FILE" "$DEST"
    done
    lb clean
}

clean_share(){
    local TMPSHARE="/srv/tmpshare/"
    find "$TMPSHARE/" -mindepth 1 -delete
    echo "All content in this directory will be removed periodically!" \
         >> "$TMPSHARE/README"
}

## main:

if ! auto-apt-proxy | grep -q 'http://127.0.0.1:3142' ; then
    echo "Cannot find the local apt proxy needed to build live images."
    exit 1
fi

for IMG in {{ build_images|join(' ') }} ; do
    echo "=========== Building image $IMG ==========="
    run_build $IMG
done
clean_share
