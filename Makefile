PREFIX=$(PWD)

ifeq (, $(shell which x86_64-w64-mingw32-g++))
GCC=g++
else
GCC=x86_64-w64-mingw32-g++
GCC_EXTRA_ARGS=-static -static-libgcc -static-libstdc++
endif

prep:
	git submodule update --init

bullet-native:
	cd bullet3; cmake .
