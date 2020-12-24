#!/bin/bash
set -e
root_dir=$(dirname "$(dirname "$(readlink -f "$0")")")
src_dir=$root_dir/src
output_dir=$root_dir/output
cd $src_dir
for subdir in `ls`; do
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

    # Clean    
    rm *.bak* indent.log
    cd -
done
