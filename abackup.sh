#!/bin/bash

OTHER=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--help)
    HELP="1"
    shift
    ;;
    status)
    STATUS="1"
    shift
    ;;
    run)
    RUN="1"
    shift
    ;;
    *)
    OTHER+=("$1") 
    shift 
    ;;
esac
done
set -- "${OTHER[@]}"

if [[ -n $HELP ]]; then
    echo HELP  = "${HELP}" STATUS="${STATUS}"
    exit 0
fi

source backup.cfg

if [[ -n $1 ]]; then
    echo "additional arguments:" $1
fi

if [[ -n $RUN ]]; then
    rsync ${rsyncargs} ${sourcefolder} ${destfolder}
    echo $?
fi

if [[ -n $STATUS ]]; then
    echo status
fi
