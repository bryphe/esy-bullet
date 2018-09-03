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
	cd bullet3; cmake . -DWIN32=1 -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_AR=/usr/bin/x86_64-w64-mingw32-ar -DCMAKE_LINKER=/usr/bin/x86_64-w64-mingw32-ld
	cd bullet3; make LinearMath
	cd bullet3; make BulletCollision
	cd bullet3; make BulletDynamics
	cd bullet3/lib; ls -a
