#!/bin/bash
set -e
cd $(dirname $0)
for subdir in `find . -regex '\./[0-9]*'`; do
    cd $subdir

    # Indent
    echo '##########' Indent $subdir '##########'
    for file in \
        `find . -name "*.tex" \
                -o -name "*.sty" \
                -o -name "*.cls" \
                -o -name "*.bib"`; do
        latexindent -y="defaultIndent: '    '" -w -sl -s $file
    done

    # Build
    echo '##########' Build $subdir '##########'
    latexmk -xelatex -shell-escape --outdir=output

    # Clean
    rm -rf output/
    rm *.bak* indent.log
    cd -
done
