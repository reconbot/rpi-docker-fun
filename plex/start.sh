#!/bin/sh
set -ex
# [Unit]
# Description=Plex Media Server
# After=network.target network-online.target

# [Service]
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/var/lib/plexmediaserver/Library/Application Support"
export PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_TMPDIR=/tmp

/usr/bin/test -d "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}" || /bin/mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"

export PLEX_MEDIA_SERVER_INFO_VENDOR="$(grep ^NAME= /etc/os-release | awk -F= "{print \$2}" | tr -d \" )"
export PLEX_MEDIA_SERVER_INFO_DEVICE="PC"
export PLEX_MEDIA_SERVER_INFO_MODEL="$(uname -m)"
export PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION="$(grep ^VERSION= /etc/os-release | awk -F= "{print \$2}" | tr -d \" )"
export LD_LIBRARY_PATH=/usr/lib/plexmediaserver/lib
"/usr/lib/plexmediaserver/Plex Media Server"
