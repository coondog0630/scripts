#!/bin/bash

# Location of the backup logfile.
LOGFILE="/path/to/logfile.log"
touch $LOGFILE

# Location to place backups.
BACKUPDIR="/directory/to/place/backups"

timeslot=`date +%H-%M`
databases=`psql -h localhost -U postgres -q -c "\l" | sed -n 4,/\eof/p | grep -v rows\) | awk {'print $1'}`

for i in $databases; do
        TIMEINFO=`date '+%T %x'`
        echo "Start Time: $TIMEINFO for time slot $timeslot on database: $i " >> $LOGFILE
        vacuumdb -z -h localhost -U postgres $i >/dev/null 2>&1
        pg_dump $i -h 127.0.0.1 | gzip > "$BACKUPDIR/postgresql-$i-$timeslot-database.gz"
done
