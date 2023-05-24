#put our arguments into their respective variables
$device = $args[0]
$port = $args[1]
$start = $args[2]
$stop = $args[3]
#function pingedevice
#ping the device to see if it is on the network
function pingdevice{
if(test-connection $device -erroraction silentlycontinue){
write-output "$device is up"
}else{
write-output "$device is down"
exit
}
}
#function checkports
#check to see if our ports are open
function checkports{
if ($port -match "multi"){ #this branch checks a port range
for ($counter=$start; $counter -le $stop; $counter++)
{
write-output "testing port $counter on $device"
$porttest = new-object Net.Sockets.TcpClient
try{
$connect = $porttest.connect($device,$counter)
write-output "$counter is open"
}catch{
write-output "$counter is closed"
}
}
}else{ #this branch checks a single port
write-output "testing port $port on $device"
$porttest = new-object Net.Sockets.TcpClient
try{
$connect = $porttest.connect($device,$port)
write-output "$port is open"
}catch{
write-output "$port is closed"
}
}
}
#run our functions
pingdevice
checkports