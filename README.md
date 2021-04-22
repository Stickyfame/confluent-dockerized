# confluent-dockerized
Docker image and docker-compose for the Confluent tool (HTTP API for Hardware Management)

## Run confluent

Edit the file `.env`, then run `docker-compose -d up`.

Docker will configure a confluent container with :

- A builded docker image `local/confluent`
- API User, API Password and host port for the API from the `.env` file

## Access confluent API

The confluent API is available at `http://docker_host:4005` (or another port if you changed `.env` file). You can use the CLI (ssh to confluent container and use confluent CLI), use the web GUI, or make `curl` requests to obtain `json` responses:

```bash
curl -g -k -u confluentuser:confluentpassword http://docker_host:4005/nodes/ipmisim/power/state -H "CONTENT-TYPE:application/json" -H "Accept: application/json" -d '{"state": "on"}'
```

## Run confluent with IPMI simulator (testing purpose)

`cd` in `test` directory, then run `docker-compose -d up`.

Docker will also create an IPMI simulator and attach it to the docker network.

In order to test Confluent, you need to create a new node in Confluent, and change the BMC host, user, password in the node configuration.

`ipmisim` has the following hardware management configuration :
    - BMC host : `ipmisim`
    - BMC port : (default) `623`
    - BMC user : `ADMIN`
    - BMC password : `ADMIN`

