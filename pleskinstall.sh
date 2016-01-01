#!/bin/bash
################################################################
# This Script download the last relase and execute it.         #
################################################################
# Developed By Giovanni Metitieri, follow me on Github!        #
#                         https://github.com/GiovanniMet/      #
################################################################
# Version 1.0                                                  #
# Build Date 01/2016                                           #
################################################################

install_plesk(){
	mkdir -p plesk_sync
	wget -O plesk_sync/plesk-installer "http://autoinstall.plesk.com/plesk-installer" --no-check-certificate -nv
	chmod +x plesk_sync/plesk-installer
	screen -S plesk-installer -d -m ~/plesk_sync/plesk-installer
    echo "Connect to server and write: screen -R to continue installation."
	
}

main(){
	    if [ -r /opt/psa/version ]; then
        PLESK_VERSION=`cat /opt/psa/version`
        echo "[INFO] Found Parralles Plesk $PLESK_VERSION . Script now exit"
        exit 0
    else
    	echo "[INFO] Plesk not found. Installing plesk."
    	install_plesk;
    fi

}

main
