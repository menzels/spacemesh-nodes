FROM golang:1.21
RUN apt update && apt install -y \
    git \
    git-lfs \
    make \
    curl \
    build-essential \
    unzip \
    wget \
    ocl-icd-opencl-dev \
    ocl-icd-libopencl1
RUN git-lfs install
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
WORKDIR /container
RUN git clone --progress --verbose https://github.com/spacemeshos/go-spacemesh
WORKDIR /container/go-spacemesh
RUN git checkout v1.1.8
RUN make get-libs
RUN make install
RUN make build
WORKDIR /container/go-spacemesh/build
COPY ./config.mainnet.json ./config.mainnet.json
RUN chmod +x go-spacemesh
EXPOSE 7513 
CMD ./go-spacemesh --config config.mainnet.json --data-folder ./volume/node_data --smeshing-opts-datadir ./post_data --metrics --smeshing-start --smeshing-coinbase $SMESHING_COINBASE_ADDRESS
# ENTRYPOINT [ "./go-spacemesh", "--config", "config.mainnet.json", "--data-folder", "./node_data" ]
