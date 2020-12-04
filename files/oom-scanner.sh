#!/bin/bash
# DESC: scan for todays oom events. this script gets called right after boot by cron
# DATE: 20190514
# WHO: Chris Ruettimann<cruettimann@uniqconsulting.ch>

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin


TODAY_CRASHES=$( last | grep "$(LC_ALL=en_US.UTF-8 date '+%a %b %e')" | grep crash | wc -l )
SUBJECT="ERROR: $(uname -n) had $TODAY_CRASHES system crashes today and is booting up now"
TO="root"
BODY="
This Server had $TODAY_CRASHES crashes today ($(LC_ALL=en_US.UTF-8 date '+%a %b %e')).
Please forward this message to linux team, it needs debugging.

best regards
uniQconsulting ag - ITSM Linux Team

CRASHES:
$(last | grep crash | head -50 )

BOOT LOG:
$(last | head -50 )
"

if [ $TODAY_CRASHES -gt 0 ] ; then
   echo "$BODY" | mailx -s "$SUBJECT" "$TO"
   logger -t $(basename $0) "ERROR: $(uname -n) had $TODAY_CRASHES system crashes today and is booting up now"
fi

