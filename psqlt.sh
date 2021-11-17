#!/bin/bash 
# This script accepts two arguments.
# the first argument is the `name` of the node we want to connect
# the second is to specify the `database`, if it's not supplied
# then it will default to "bdrtest"

POSTMASTER="${HOME}/work/${PG_WORKON}/bdr/tmp_check/t_*$1_data*/pgdata/postmaster.pid"
TESTPORT=`awk '{if (FNR == 4) {print $0}}' ${POSTMASTER}`
TESTHOST=`awk '{if (FNR == 5) {print $0}}' ${POSTMASTER}`
if [ -n "$2"  ]
then
	TESTDB=$2
else
	TESTDB="bdrtest"
fi

psql -h $TESTHOST -p $TESTPORT -U firion -d $TESTDB
