FROM ubuntu:20.10

RUN apt-get update && apt-get upgrade -y

COPY frp_0.34.3_linux_amd64.tar.gz /tmp
ADD entrypoint.sh /var

RUN cd /tmp && \
  mkdir frp && \
  tar -zxf frp_0.34.3_linux_amd64.tar.gz -C frp --strip-components 1 && \
  cp frp/frpc /usr/bin && \
  cp frp/frps /usr/bin && \
  cp frp/frpc_full.ini /var && \
  cp frp/frps_full.ini /var && \
  chmod +x /var/entrypoint.sh

ENTRYPOINT /var/entrypoint.sh
