#!/bin/sh
#
# Tags or checks to-do items as completed. 
#

#$Id: markdone.sh,v 1.1 2008/07/06 16:47:04 mjb Exp $

CHECK=0
TAG=1
while getopts ct opt
do
    case $opt in
    c)
        CHECK=$(((CHECK + 1) % 2))
        ;;
    t)
        TAG=$(((TAG + 1) % 2))
        ;;
    esac
done

shift $((OPTIND - 1))

# Marking of to-do items is done with sed -E. Define regular expressions 
# to replace leading dashes with plusses, add an @done tag to the end of
# the to-do item, and to remove an @done tag from the end of a line if it
# duplicates an earlier @done tag. This could remove a duplicate tag that
# is supposed to be there, but duplicate tags provide no additional 
# meaning so this shouldn't really matter.
#
# The patterns are applied in order: checking, tagging, eliminating 
# duplicates. An empty tag means that nothing will happen in that 
# stage. 
#

if [ $TAG == 1 ]
then 
    TAG_PATTERN="-e 's/^([[:space:]]*[-+].*[^[:space:]])[[:space:]]*$/\1 @done/'"
    DEDUP_PATTERN="-e 's/^([[:space:]]*[-+].*@done[[:>:]].*) @done$/\1/'"
else
    TAG_PATTERN=
    DEDUP_PATTERN=
fi

if [ $CHECK == 1 ]
then
    CHECK_PATTERN="-e 's/^([[:space:]]*)-/\1+/'"
else
    CHECK_PATTERN=
fi

eval sed -E $CHECK_PATTERN $TAG_PATTERN $DEDUP_PATTERN

