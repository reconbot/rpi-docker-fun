#!/bin/sh
set -ex

[ ! -e $IPFS_PATH/config ] && ipfs init
ipfs daemon
