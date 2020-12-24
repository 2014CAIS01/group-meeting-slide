#!/bin/bash
set -e
root_dir=$(dirname "$(dirname "$(readlink -f "$0")")")
src_dir=$root_dir/src
output_dir=$root_dir/output
cd $src_dir
for subdir in `ls`; do
    cd $subdir

    # Build
    echo '##########' Build $subdir '##########'
    latexmk -xelatex -shell-escape --outdir=$output_dir/$subdir
    # Clean
    latexmk -c --outdir=$output_dir/$subdir
    cd -
done
