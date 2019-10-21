#!/bin/bash

rrdtool create traffic.rrd \
	--step '60' \
	'DS:input:COUNTER:120:U:U' \
	'DS:output:COUNTER:120:U:U' \
	'RRA:AVERAGE:0.5:1:60' \
	'RRA:AVERAGE:0.5:2:60' \
	'RRA:AVERAGE:0.5:60:24'     
