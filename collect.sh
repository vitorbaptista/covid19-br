#!/bin/bash

set -e
SCRIPT_PATH=$(dirname ${BASH_SOURCE[0]})
source $SCRIPT_PATH/base.sh

mkdir -p $DOWNLOAD_PATH $OUTPUT_PATH $LOG_PATH
for state in ce pr sp; do
	log_filename="$LOG_PATH/caso-${state}.log"
	csv_filename="$OUTPUT_PATH/caso-${state}.csv"
	rm -rf "$log_filename" "$csv_filename"
	time scrapy runspider \
		--loglevel=INFO \
		--logfile="$log_filename" \
		-o "$csv_filename" \
		corona_${state}_spider.py
done
