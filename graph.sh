#!/bin/bash

while true 
do
sleep 60
rrdtool graph visualize_traffic_1_hour.png --start -3600 \
	    --full-size-mode \
	    --slope-mode \
            --height '300' \
	    --rigid \
	    --alt-autoscale \
       	    'DEF:inoctets=traffic.rrd:input:AVERAGE' \
            'DEF:outoctets=traffic.rrd:output:AVERAGE' \
	    'CDEF:inbits=inoctets,8,*' \
	    'CDEF:outbits=outoctets,8,*' \
       	    'LINE1:outbits#00FF00:"Out traffic"' \
            'LINE1:inbits#0000FF:"In traffic"'

rrdtool graph visualize_traffic_2_hours.png --start -7200 \
            --full-size-mode \
	    --slope-mode \
            --height '300' \
            --rigid \
            --alt-autoscale \
            'DEF:inoctets=traffic.rrd:input:AVERAGE' \
            'DEF:outoctets=traffic.rrd:output:AVERAGE' \
            'CDEF:inbits=inoctets,8,*' \
            'CDEF:outbits=outoctets,8,*' \
            'LINE1:outbits#00FF00:"Out traffic"' \
            'LINE1:inbits#0000FF:"In traffic"'

rrdtool graph visualize_traffic_1_day.png --start -43200 \
             --full-size-mode \
	     --slope-mode \
             --height '300' \
             --rigid \
             --alt-autoscale \
             'DEF:inoctets=traffic.rrd:input:AVERAGE' \
             'DEF:outoctets=traffic.rrd:output:AVERAGE' \
	     'CDEF:inbits=inoctets,8,*' \
             'CDEF:outbits=outoctets,8,*' \
             'LINE1:outbits#00FF00:"Out traffic"' \
             'LINE1:inbits#0000FF:"In traffic"'
done
