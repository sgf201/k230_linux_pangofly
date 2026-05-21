#!/bin/bash

set -e

TOPDIR=$(cd $(dirname $0) && pwd)

echo "Initializing K230 Linux Pangofly SDK..."

# Clone Pangofly as submodule
echo "Cloning Pangofly..."
if [ ! -d $TOPDIR/pangofly ]; then
    git submodule add https://github.com/sgf201/pangofly.git pangofly
else
    echo "Pangofly already exists, skipping..."
fi

echo "Initialization complete!"
echo ""
echo "Next steps:"
echo "  1. (Recommended) Use Docker compilation:"
echo "     curl -fsSL https://www.kendryte.com/misc/install.sh | bash"
echo "     k230 make CONF=k230_canmv_defconfig"
echo ""
echo "  2. Or clone the full K230 Linux SDK:"
echo "     git clone git@github.com:kendryte/k230_linux_sdk.git"
