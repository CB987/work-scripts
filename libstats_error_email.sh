#!/usr/bin/env bash

#sends an email with the size of the curllog from the day's libstats curl
#Clare Barton, 11/2019

mail_list="email"
bindir="/ezpaarse/bin/"
file_in_question="/ezpaarse/work/curl.log"

if [ ${file_in_question} ]; then
    if [ $(</tmp/curlsize.txt) == 2282 -o $(</tmp/curlsize.txt) == 2281 ];
        then
            mailx -s "libstats curl.log size" "${mail_list}" <<EOM
            never stop tweaking 
            $(</tmp/curlsize.txt)
            all is well
EOM
        else
            mailx -s "problem with libstats curl.log size" "${mail_list}" <<EOM
            it should have broken
            you will have to go in and rerun it
            $(</tmp/curlsize.txt)
EOM
    fi
fi

exit 0
