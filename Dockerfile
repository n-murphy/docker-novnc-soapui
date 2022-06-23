FROM debian:bullseye-slim

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      fluxbox \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb \
      openjdk-17-jre


# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=no \
    RUN_SOAPUI=yes \
    RUN_FLUXBOX=yes

COPY . /app


##
## Download SoapUI installation script and run it
##

RUN wget https://s3.amazonaws.com/downloads.eviware/soapuios/5.7.0/SoapUI-x64-5.7.0.sh

RUN chmod +x /app/SoapUI-x64-5.7.0.sh && \
    /app/SoapUI-x64-5.7.0.sh -q && \
    rm -f /app/SoapUI-x64-5.7.0.sh 

##
## No need for the jre bundled with the installation so lets get rid of it!
##

RUN rm -rf /usr/local/SmartBear/SoapUI-5.7.0/jre

##
## Uncomment the alias commands in the .bashrc
##

RUN sed -i 's/\# alias/alias/' ~/.bashrc


CMD ["/app/entrypoint.sh"]
EXPOSE 8080
