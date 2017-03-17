#!/bin/sh

MZZ="0.7"
mkdir -p ${HOME}/.cate/${MZZ}
export > ${HOME}/.cate/${MZZ}/env.txt
echo ${PREFIX} > ${HOME}/.cate/${MZZ}/cate.location