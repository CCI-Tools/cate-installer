#!/bin/sh

VERSION="0.8.0rc3"
VERSION_DIR="${HOME}/.cate/${VERSION}"

mkdir -p ${VERSION_DIR}
echo ${PREFIX} > ${VERSION_DIR}/cate.location