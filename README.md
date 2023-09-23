# spacemesh nodes

A collection of scripts and configurations to run a stack of spacemesh nodes via docker.

## prerequisites

Installed Docker

## setup

- adapt docker-compose.yml
- run 'docker compose up -d --build'
- run_grafana.cmd (TODO: include those into docker-compose.yml)
- run_prometheus.cmd
- import grafana dashboard, for example https://github.com/BlackBlocks-io/spacemesh-dashboard


## tips

### copy existing state.sql from a fully synced node to the volume a spacemesh node

docker container create --name dummy -v spacemesh-volume-XX:/xyz dummy
docker cp path/to/state/sql dummy:/xyz
docker rm dummy