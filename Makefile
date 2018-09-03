ifeq (, $(shell which x86_64-w64-mingw32-g++))
CMAKE_ARGS=
else
CMAKE_ARGS=-DWIN32=1 -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_AR=/usr/bin/x86_64-w64-mingw32-ar -DCMAKE_LINKER=/usr/bin/x86_64-w64-mingw32-ld
endif

prep:
	git submodule update --init

bullet-native:
	cd bullet3; cmake . $(CMAKE_ARGS)
	cd bullet3; make LinearMath
	cd bullet3; make BulletCollision
	cd bullet3; make BulletDynamics
	cd bullet3/lib; ls -a

install:
	cp -r bullet3/lib $(PREFIX)/lib/native
	cp -r bullet3/src $(PREFIX)/lib/include
	cp -r ammo.js/builds $(PREFIX)/lib/js

