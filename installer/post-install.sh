#!/bin/sh

# Use PEP 440 compliant version identifier
VERSION="2.0.0.dev12"
VERSION_DIR="${HOME}/.cate/${VERSION}"

mkdir -p ${VERSION_DIR}
echo ${PREFIX} > ${VERSION_DIR}/cate.location