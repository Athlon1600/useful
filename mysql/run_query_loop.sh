#!/bin/bash

for i in {1..1000}
do
	echo "Iteration: $i";
	mysql -u root -pPASSWORD db_name -e "DELETE FROM ids2 WHERE the_pid IS NOT NULL LIMIT 10000;"
	echo "We sleep now";
	sleep 5
done
