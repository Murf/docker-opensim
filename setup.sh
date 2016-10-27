#!/bin/sh

echo "First time only setup of OpenSim ini files, you will still have to enter your region external IP and port settings in the OpenSimulator console"
echo
echo -n "Enter your external IP address and press [ENTER]: "
read EXTERNAL_IP
echo -n "Enter your http port number (eg 9000 or 8002) and press [ENTER]: "
read TCP_PORT
echo -n "Enter your region udp port range (eg 9001-9009 means 9001 through to 9009) and press [ENTER]: "
read UDP_PORT_RANGE
echo
echo
PS3='Select which configuration you want:: '
options=("Standalone" "Standalone Hypergrid" "OSGrid HG" "Metaversum HG")
select opt in "${options[@]}"
do
    case $opt in
        "Standalone")
            echo "Configuring Opensim for Standalone mode"
            cp volumes/config-include/StandaloneCommon.ini.example volumes/config-include/StandaloneCommon.ini
            sed -e 's/; Include-Architecture = "config-include\/Standalone.ini"/Include-Architecture = "config-include\/Standalone.ini"/' config/OpenSim.ini.example > OpenSim.ini
            sed -i "s/127.0.0.1/$EXTERNAL_IP/" OpenSim.ini
            sed -i "s/; http_listener_port = 9000/http_listener_port = $TCP_PORT/" OpenSim.ini
            sed -i "s/PublicPort = \"8002\"/PublicPort = \"$TCP_PORT\"/" OpenSim.ini
            break
            ;;
        "Standalone Hypergrid")
            echo "Configuring Opensim for Standalone Hypergrid mode"
            cp volumes/config-include/StandaloneCommon.ini.example volumes/config-include/StandaloneCommon.ini
            sed -i "s/; HomeURI = /HomeURI = /" volumes/config-include/StandaloneCommon.ini
            sed -i "s/; GatekeeperURI = /GatekeeperURI = /" volumes/config-include/StandaloneCommon.ini
            sed -e 's/; Include-Architecture = "config-include\/StandaloneHypergrid.ini"/Include-Architecture = "config-include\/StandaloneHypergrid.ini"/' config/OpenSim.ini.example > OpenSim.ini
            sed -i "s/127.0.0.1/$EXTERNAL_IP/" OpenSim.ini
            sed -i "s/; http_listener_port = 9000/http_listener_port = $TCP_PORT/" OpenSim.ini
            sed -i "s/PublicPort = \"8002\"/PublicPort = \"$TCP_PORT\"/" OpenSim.ini
            break
            ;;
        "OSGrid HG")
            echo "Configuring Opensim for OSGrid with Hypergrid"
            cp config/ini-templates/osgrid/config-include/*.ini volumes/config-include
            sed -e "s/127.0.0.1/$EXTERNAL_IP/" config/ini-templates/osgrid/OpenSim.ini.osgrid > OpenSim.ini
            sed -i "s/9000/$TCP_PORT/" OpenSim.ini
            break
            ;;
        "Metaversum HG")
            echo "Configuring Opensim for Metaversum with Hypergrid"
            cp config/ini-templates/metaversum/config-include/*.ini volumes/config-include
            sed -e "s/127.0.0.1/$EXTERNAL_IP/" ini-templates//metaversum/OpenSim.ini.Metaversum > OpenSim.ini
            sed -i "s/9000/$PORT/" OpenSim.ini
            break
            ;;
        *) echo invalid option;;
    esac
done
sed -i "s/REPLACE_WITH_TCP_PORT/$TCP_PORT/" docker-compose.yml
sed -i "s/REPLACE_WITH_TCP_PORT/$TCP_PORT/" docker-compose.yml
sed -i "s/REPLACE_WITH_UDP_PORT_RANGE/$UDP_PORT_RANGE/" docker-compose.yml
sed -i "s/REPLACE_WITH_UDP_PORT_RANGE/$UDP_PORT_RANGE/" docker-compose.yml

