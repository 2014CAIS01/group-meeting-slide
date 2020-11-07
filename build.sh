#!/bin/bash
set -e
cd $(dirname $0)
for subdir in `find . -regex '\./[0-9]*'`; do
    cd $subdir
    latexindent  -y="defaultIndent: '    '" -w *.tex
    latexmk -xelatex -shell-escape --outdir=output
    rm -rf output/
    cd -
done
