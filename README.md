# EasyapptContained
A docker image of an [Easy!Appointments](https://easyappointments.org/) server

## Requirements
- docker
- docker-compose

## Setup
- Clone [this](https://www.github.com/TheLastBilly/easyapptcontained.git) repository in your server.
- Edit **variables.env** to suit your needs. The final address of your installation would be derived from EA_HOSTNAME and EA_PORT (i.e: https://localhost:8000)
- Edit **docker-compose.yml** and change the `ports:` directive at the end with the port you setup in the previous step (if you did so)
- **(Optional)** Place your ssl certificate files in the certs folder with the names **cert.crt** (for the certificate file) and **cert.key** (for the key file). If you choose not to do this step, **EasyapptContained** will create self signed certificates for you.
- Run `docker-compose up -d` to start the server