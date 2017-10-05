#!/bin/sh

VERSION="1.0.0.dev2"
VERSION_DIR="${HOME}/.cate/${VERSION}"

mkdir -p ${VERSION_DIR}
echo ${PREFIX} > ${VERSION_DIR}/cate.location