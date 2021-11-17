#!/bin/bash 
# This script accepts one argument that is the name of the node we want to connect to


POSTMASTER="${HOME}/work/${PG_WORKON}/bdr/tmp_check/t_*$1_data*/pgdata/postmaster.pid"
TESTPORT=`awk '{if (FNR == 4) {print $0}}' ${POSTMASTER}`
TESTHOST=`awk '{if (FNR == 5) {print $0}}' ${POSTMASTER}`

psql -h $TESTHOST -p $TESTPORT -U firion -d postgres
