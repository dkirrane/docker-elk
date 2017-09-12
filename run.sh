#!/bin/bash

# general good practice (stop on error, missing variables, verbose mode):
set -e

function getIp() {
	case "$(uname -s)" in
	   Linux)
	     local iface=$(ip route list | awk '/^default/{ print $5 }' | tail -n -1)
		 IP=`ip addr show ${iface} | awk '/inet / {print $2}' | cut -d/ -f1`
		 echo ${IP}
	     ;;

	   CYGWIN*|MINGW*|MSYS*)
	     IP=$(powershell -Command '(Get-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv4 -AddressState Preferred).IpAddress')
	     echo ${IP}
	     ;;

	   *)
	     echo "ERROR - Unknown OS type $(uname -s)"
	     exit 1
	     ;;
	esac
}


export HOST_IP=$(getIp)
echo ${HOST_IP}

docker-compose down
docker-compose kill

docker-compose up -d elasticsearch logstash kibana

echo ""
echo "Waiting for Kibana to start"
docker-compose run --rm elk-wait

echo ""
echo "Starting filebeat"
# docker-compose up -d filebeat
# docker-compose run filebeat

nc localhost 5000 < ./filebeat/test-logs/wa-impu_1_1.json.log