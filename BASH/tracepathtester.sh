#!/usr/bin/env bash
# Now, using Tracepath in the same way as Ping Tester :
local=127.0.0.1
dns=8.8.8.8
modemhome=192.168.1.1
company1=172.16.1.1
company2=10.0.1.1
company3=10.0.0.1
debug=0.0.0.0
custom=
trace=
printf '
-------------------------------
  TRACEPATH MENU CHECKER V1.0
-------------------------------
Choose a way to check Tracepath/route :

local       : Make a route to 127.0.0.1   (loopback/yourself)
dns         : Make a route to 8.8.8.8     (Google DNS)
home        : Make a route to 192.168.1.1 (Home Router or Company Router)
company1    : Make a route to 172.16.1.1  (Company network IP)
company2    : Make a route to 10.0.1.1  (Company network IP)
company3    : Make a route to 10.0.0.1  (Company network IP)

custom      : Make a route to custom IP (for Company with more IP or Home
with more than one Router)

'
echo -n "Make your choice : "
read trace
if [[ $trace = local ]]; then
  tracepath $local 2> /dev/null
elif [[ $trace = dns ]]; then
  tracepath $dns 2> /dev/null
elif [[ $trace = home ]]; then
  tracepath $modemhome 2> /dev/null
elif [[ $trace = company1 ]]; then
  tracepath $company1 2> /dev/null
elif [[ $trace = company2 ]]; then
  tracepath $company2 2> /dev/null
elif [[ $trace = company3 ]]; then
  tracepath $company3 2> /dev/null
elif [[ $trace = custom ]]; then
  echo "Enter IP : "
  read $custom
  tracepath $custom 2> /dev/null
else
  echo "Aborting!"
  exit
fi
