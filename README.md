# SoapUI in Docker

As the title implies this is the SoapUI (open source API test tool) running in a Docker container. In order to facilitate displaying the UI, I've leveraged the efforts of **@theasp** and his [docker-novnc](https://github.com/theasp/docker-novnc) repository which is intended to be used for displaying X11 apps from other containers in a browser. The **docker-novnc** repository is based on an alpine version created by **@psharkey** [novnc](https://github.com/psharkey/docker/tree/master/novnc) which in turn is based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker) and [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/). 

So a big thanks to those guys. 

In my approach I've bundled novnc and SoapUI into a single container.


## Image Contents

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [xterm](http://invisible-island.net/xterm/) - Terminal emulator for the X Window.
* [SoapUI 5.7.0](https://www.soapui.org/) - Open source API test tool
* [supervisord](http://supervisord.org) - to keep it all running

## Usage

### Variables

You can specify the following variables:
* `DISPLAY_WIDTH=<width>` (1024)
* `DISPLAY_HEIGHT=<height>` (768)
* `RUN_XTERM={yes|no}` (yes)
* `RUN_SOAPUI={yes|no}` (yes)
* `RUN_FLUXBOX={yes|no}` (yes)

### Run using docker command line

```bash
$ docker run -d --name soapui --rm -p 8080:8080 soapui-in-docker:bullseye
```
Open a browser and see  **SoapUI 5.7.0** at `http://localhost:8080/vnc.html`

### Run using docker compose
```bash
# If you have docker desktop installed
docker compose up -d

# If you have manually installed docker-compose then its:
docker-compose up -d
```