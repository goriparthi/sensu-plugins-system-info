#!/bin/bash
# Author: Author of this clumsy bash script is Mr.Prashanth Goriparthi

spec_time=`date +%s`
host=`hostname`

mem=`free -m | gawk  '/Mem:/{print $2}'`
mem_gb=$(awk 'BEGIN { rounded = sprintf("%.0f", ("'"$mem"'"/1000)*4); print rounded/4 }')
proc_count=`cat /proc/cpuinfo | grep processor | wc -l`
os=`cat /etc/redhat-release | grep -o '[0-9].[0-9].[0-9]*'`
uptime=$(uptime | grep -o "[0-9]* days" | awk  ' { print $1 } ')

echo $host.system-info.operating-system ${os} $spec_time
echo $host.system-info.total-memory ${mem_gb} $spec_time
echo $host.system-info.total-processor-count ${proc_count} $spec_time
echo $host.system-info.uptime ${uptime} $spec_time
