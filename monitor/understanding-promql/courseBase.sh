# # This isn't working
# docker run -d \
#   --net="host" \
#   --pid="host" \
#   -v "/:/host:ro,rslave" \
#   quay.io/prometheus/node-exporter \
#   --path.rootfs=/host

wget https://github.com/prometheus/node_exporter/releases/download/v0.14.0/node_exporter-0.14.0.linux-amd64.tar.gz
tar -xzf node_exporter-*.linux-amd64.tar.gz
cd node_exporter-*.linux-amd64
./node_exporter &
