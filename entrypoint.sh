/usr/bin/frps -c /var/frps_full.ini &

sleep 1

netstat -ntlup | grep frps

tail -f frps.log
