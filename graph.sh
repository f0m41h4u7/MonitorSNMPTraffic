#!/bin/bash

while true 
do
sleep 60
rrdtool graph visualize_traffic_1_hour.png --start -3600 \
	    --slope-mode \
       	    'DEF:inbytes=traffic.rrd:input:AVERAGE' \
            'DEF:outbytes=traffic.rrd:output:AVERAGE' \
	    'CDEF:inbits=inbytes,8,*' \
            'CDEF:outbits=outbytes,8,*' \
       	    'LINE1:outbits#00FF00:"Out traffic"' \
            'LINE1:inbits#0000FF:"In traffic"'

rrdtool graph visualize_traffic_2_hours.png --start -7200 \
	    --slope-mode \
            'DEF:inbytes=traffic.rrd:input:AVERAGE' \
            'DEF:outbytes=traffic.rrd:output:AVERAGE' \
	    'CDEF:inbits=inbytes,8,*' \
	    'CDEF:outbits=outbytes,8,*' \
            'LINE1:outbits#00FF00:"Out traffic"' \
            'LINE1:inbits#0000FF:"In traffic"'

rrdtool graph visualize_traffic_1_day.png --start -43200 \
	    --slope-mode \
            'DEF:inbytes=traffic.rrd:input:AVERAGE' \
            'DEF:outbytes=traffic.rrd:output:AVERAGE' \
	    'CDEF:inbits=inbytes,8,*' \
            'CDEF:outbits=outbytes,8,*' \
            'LINE1:outbits#00FF00:"Out traffic"' \
            'LINE1:inbits#0000FF:"In traffic"'
done
