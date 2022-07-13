# SoapUI in Docker

As the title implies this is the SoapUI (open source API test tool) running in a Docker container. In order to facilitate displaying the UI, I've leveraged the efforts of the [Webtop](https://docs.linuxserver.io/images/docker-webtop) container from **linuxserver.io** and switched from using **novnc** (you can still checkout my novnc efforts [here](https://github.com/n-murphy/docker-soapui/tree/novnc))


## Usage
This is still under construction and the content will be fleshed out soon.

### Run using docker compose
```bash
# If you have docker desktop installed
docker compose -f docker-compose-ubuntu-mate.yaml up -d

# If you have manually installed docker-compose then its:
docker-compose -f docker-compose-ubuntu-mate.yaml up -d
```
Open a browser and see  **SoapUI 5.7.0** at `http://localhost:3000`