GCC_VERSION := 13.1

.PHONY: gcc-prerequisites gcc-configure gcc-build

gcc-prerequisites:
	cd infra/gcc && ./contrib/download_prerequisites

# https://stackoverflow.com/questions/26976916/minimal-gcc-build
gcc-configure:
	cd infra/gcc && \
	./configure --enable-languages=c,c++ \
	            --disable-bootstrap \
	            --disable-multilib \
	            --disable-nls \
	            --program-suffix=-${GCC_VERSION}

gcc-build:
	cd infra/gcc && make -j

gcc-compile_commands:
	bear -- make
