#!/bin/sh

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

function getLine () {
	DOC=$1
	LEN=$(wc -l $DOC | sed 's/ *//' | cut -d' ' -f1)
	RND=$(($(($RANDOM % $LEN)) + 1))
	TXT=$(head -n $RND $DOC | tail -1)
	echo $TXT
}

UNO=$(getLine $UNO)
DOS=$(getLine $DOS)
TRE=$(getLine $TRE)
QUA=$(getLine $QUA)
CIN=$(getLine $CIN)

echo "\n\t$UNO $DOS $TRE $QUA $CIN.\n"
