FROM balenalib/raspberrypi3-alpine-golang:build
WORKDIR /app
RUN \
  curl https://dist.ipfs.io/go-ipfs/v0.4.19/go-ipfs_v0.4.19_linux-arm.tar.gz | tar -xvzf - && \
  cd go-ipfs && \
  ./install.sh

# Swarm TCP; should be exposed to the public
EXPOSE 4001
# Daemon API; must not be exposed publicly but to client services under you control
EXPOSE 5001
# Web Gateway; can be exposed publicly with a proxy, e.g. as https://ipfs.example.org
EXPOSE 8080
# Swarm Websockets; must be exposed publicly when the node is listening using the websocket transport (/ipX/.../tcp/8081/ws).
EXPOSE 8081

ENV IPFS_PATH /data/ipfs
VOLUME $IPFS_PATH
COPY start.sh ./
CMD ["bash", "./start.sh"]
