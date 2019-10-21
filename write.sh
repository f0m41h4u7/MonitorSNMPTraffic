#!/bin/bash

input1=$(snmpget -v2c -c Welcome 94.230.160.230 IF-MIB::ifInOctets.2 | awk -F" " '{print $NF}')
output1=$(snmpget -v2c -c Welcome 94.230.160.230 IF-MIB::ifOutOctets.2 | awk -F" " '{print $NF}')

while true
do
	sleep 60
	input2=$(snmpget -v2c -c Welcome 94.230.160.230 IF-MIB::ifInOctets.2 | awk -F" " '{print $NF}')
	output2=$(snmpget -v2c -c Welcome 94.230.160.230 IF-MIB::ifOutOctets.2 | awk -F" " '{print $NF}')

	res_in=$((input2-input1))
	res_in=$((res_in/60))
	res_out=$((output2-output1))
        res_out=$((res_out/60))
	#res_in=$((res_in*8))
	#res_in=$((res_out*8))

	input1=$input2
	output1=$output2

	echo "${res_in} :: ${res_out}"
	rrdtool update traffic.rrd N:${res_in}:${res_out}
done
