@echo off
setlocal ENABLEDELAYEDEXPANSION
for /d %%i in (.\nodes\*) do (
    echo "%%i"
    set node_id=%%~nxi
    set metrics_port=322!node_id!
    echo "!node_id!, !metrics_port!"
    docker run -d -p !metrics_port!:!metrics_port! --rm --name spacemesh-node-!node_id! --network spacemesh --network-alias spacemesh-node-!node_id! -v spacemesh-node-!node_id!:/container/go-spacemesh/build/volume spacemesh-node:1.1.8 ./go-spacemesh --config config.mainnet.json --data-folder ./volume/node_data --smeshing-opts-datadir ./volume/post_data  --metrics --metrics-port !metrics_port!
)