FROM debian:stretch-slim

ENV     DEBIAN_FRONTEND=noninteractive
RUN	apt-get update -y && apt-get dist-upgrade -y && \
	apt-get install --no-install-recommends --no-install-suggests -y \
	build-essential cmake git perl python3 bash coreutils wget bc doxygen graphviz upx flex bison zlib1g-dev libtinfo-dev autoconf automake pkg-config m4 libtool

WORKDIR	/tmp
RUN	apt-get install --no-install-recommends --no-install-suggests -y ca-certificates && \
	git clone --recursive https://github.com/avast-tl/retdec.git && \
	cd retdec && \
	mkdir build && cd build && \
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr && \
	make && make install
