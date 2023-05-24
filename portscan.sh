
#!/bin/bash
# Bash Port Scanner
# Usage ./portscan.sh example.com 1 2000
# ensure /dev/tcp/ support in bash
cat < /dev/tcp/time.nist.gov/13
# should get this 55647 11-03-27 15:41:17 50 0 0 75.2 UTC(NIST)*

MENU TCP or UDP ports

/dev/tct 
/dev/udp





host=$1
startport=$2
stopport=$3
#function pingcheck
#ping a device to see if it is up
function pingcheck
{
ping=`ping -c 1 $host | grep bytes | wc -l`
if [ "$ping" -gt 1 ];then
echo "$host is up";
else
echo "$host is down quitting";
exit
fi
}
#function portcheck
#test a port to see if it is open
function portcheck
{
for ((counter=$startport; counter<=$stopport; counter++))
do
(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter
open"
done
}
#run our functions
pingcheck
portcheck
