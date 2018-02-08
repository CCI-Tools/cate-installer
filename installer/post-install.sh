#!/bin/sh

# Use PEP 440 compliant version identifier
VERSION="1.1.0.dev1"
VERSION_DIR="${HOME}/.cate/${VERSION}"

mkdir -p ${VERSION_DIR}
echo ${PREFIX} > ${VERSION_DIR}/cate.location