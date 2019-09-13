#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

LIST="$DIR/reads_list.txt"

if [ ! -e "$LIST" ]; then
	echo "Missing reads list ($LIST)"
	exit 1
fi

mkdir -p  "$DIR"/../data/reads
cd  "$DIR"/../data/reads
cat "$LIST" |  xargs wget
cd -

