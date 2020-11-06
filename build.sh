#!/bin/bash
set -e
cd $(dirname $0)
for subdir in `find . -regex '\./[0-9]*'`; do
    cd $subdir
    latexmk -xelatex -shell-escape
    cd -
done
