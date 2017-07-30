#!/bin/bash

SRCS=txts
OPEN="1_opener.txt"
PLAT="2_platform.txt"
TRAN="3_transition.txt"
VERB="4_action.txt"
SUBJ="5_subject.txt"

UNO=$SRCS/$OPEN
DOS=$SRCS/$PLAT
TRE=$SRCS/$TRAN
QUA=$SRCS/$VERB
CIN=$SRCS/$SUBJ

END=""

function getLine () {
	DOC=$1
	LEN=$(wc -l $DOC | sed 's/ *//' | cut -d' ' -f1)
	RND=$(($(($RANDOM % $LEN)) + 1))
	if [ $# -gt 1 ] ; then
		if [ $(($RND % 2)) -eq 0 ] ; then
			END="?"
		else
			END="."
		fi
		echo -n "$END#"
	fi
	TXT=$(head -n $RND $DOC | tail -1)
	echo $TXT
}

UNO=$(getLine $UNO "1")
DOS=$(getLine $DOS)
TRE=$(getLine $TRE)
QUA=$(getLine $QUA)
CIN=$(getLine $CIN)

END=$(echo $UNO | cut -d'#' -f1)
UNO=$(echo $UNO | cut -d'#' -f2-)

echo "$UNO $DOS $TRE $QUA $CIN$END"
