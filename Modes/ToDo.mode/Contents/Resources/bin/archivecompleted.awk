#!/usr/bin/awk -f 

# Move completed to-do items to an archive at the end of the project
# list. To-dos can be marked with an @done tag or checked off by 
# changing the leading - to a +. Alter how to-dos are handled by 
# setting the variable Mode to "c" (checking), "t" (tagging), or "ct" 
# (both). Default behavior is Mode="t"
#

#$Id: archivecompleted.awk,v 1.4 2008/08/21 17:36:09 mjb Exp $

BEGIN {
    # Set globals
    Completed[0] = ""
    Archived[0] = ""
    Ncomplete = 0
    Narchived = 0
    if (Mode!="c" && Mode!="t" && Mode!="ct") {
        Mode = "t"
    }
}

/^[[:space:]]*Archive:[[:space:]]*$/ {
    # handle Archive project
    Project = "Archive:"
    next
}

Mode == "t" && $0 ~ /^[[:space:]]*-.*@done([^[:alpha:]]|$)/ {
    # handle completed to-do that has been tagged
    recordCompleted($0)
    next    
}

Mode == "c" && $0 ~ /^[[:space:]]*\+/ {
    # handle to-do that has been checked off
    recordCompleted($0)
    next    
}

Mode == "ct" && $0 ~ /^[[:space:]]*(\+.*|-.*@done([^[:alpha:]]|$))/ {
    # handle either to-do form
    recordCompleted($0)
    next
}

/^[[:space:]]*[^-+[:space:]].*:[[:space:]]*$/ {
    # handle projects
    match($0, /[^[:space:]].*:/)
    Project = substr($0, RSTART, RLENGTH-1)
}

{
    # handle all other lines
    last = $0
    print $0
}

END {
    if ((Narchived + Ncomplete) == 0) {
        exit
    }
    
    # print the archive project header
    if (last !~ /^[[:space:]]*$/) {
        printf("\n")
    }
    print "Archive:"
    
    # print the completed to-dos
    for (k = 0; k < Narchived; k++) { 
        print Archived[k]
    }
    for (k = 0; k < Ncomplete; k++) {
        print Completed[k]
    }
}

function recordCompleted(str)
{
    if (Project == "Archive:") {
        Archived[Narchived++] = str
    } else if (str ~ /@project[[:>:]]/) {
        Completed[Ncomplete++] = str
    } else {
        Completed[Ncomplete++] = str " @project(" Project ")"
    }
}