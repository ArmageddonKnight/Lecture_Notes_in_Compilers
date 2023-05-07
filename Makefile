GCC_VERSION := 13.1

.PHONY: gcc

gcc-prerequisites:
	cd infra/gcc && ./contrib/download_prerequisites

gcc-configure:
	cd infra/gcc && \
	./configure --enable-languages=c,c++ \
	            --disable-bootstrap \
	            --disable-multilib \
	            --disable-nls \
	            --program-suffix=-${GCC_VERSION}

gcc-build:
	cd infra/gcc && make -j
