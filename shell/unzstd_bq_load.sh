#!/bin/bash

for f in ./videos_json/*.zst;
do

        ls ./videos_json | wc -l

        rm -f ./output
        unzstd $f -o ./output

        echo "----- Processing $f"

        bq load --source_format=NEWLINE_DELIMITED_JSON --ignore_unknown_values=TRUE --max_bad_records 9999 "youtube-unblock-videos:videos.test" ./output

        if [ $? -eq 0 ]; then
                echo "Success!"
                rm $f
        else
                echo "Error! Exiting..."
                break
        fi
done
