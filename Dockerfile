FROM lscr.io/linuxserver/webtop:ubuntu-mate

#
# run updates and install wget, vim and latest stable jre
#
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      wget \
      vim \
      openjdk-17-jre

WORKDIR /config

# download the SoapUI 5.7.0 install script
RUN wget https://s3.amazonaws.com/downloads.eviware/soapuios/5.7.0/SoapUI-x64-5.7.0.sh

# 
# make the install script executable, run a silent install and finally remove the
# install script and bundled jre (this is using version 16).
#
RUN chmod +x /config/SoapUI-x64-5.7.0.sh && \
    /config/SoapUI-x64-5.7.0.sh -q && \
    rm -rf /config/SoapUI-x64-5.7.0.sh \
          /config/SmartBear/SoapUI-5.7.0/jre

# copy the desktop file to the /config directory
COPY SoapUI-5.7.0.desktop .

# create the custom-cont-init.d directory if it does exist and copy
# the soapui.sh script here. This script will be picked up and run automatically
RUN mkdir -p /config/custom-cont-init.d
COPY soapui.sh /config/custom-cont-init.d
RUN chmod +x /config/custom-cont-init.d/soapui.sh