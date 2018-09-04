ifeq (, $(shell which x86_64-w64-mingw32-g++))
CMAKE_ARGS=
else
CMAKE_ARGS=-G "Unix Makefiles" -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_AR=/usr/bin/x86_64-w64-mingw32-ar -DCMAKE_LINKER=/usr/bin/x86_64-w64-mingw32-ld -DBUILD_EXTRAS=off -DBUILD_DEMOS=off
endif

prep:
	git submodule update --init

bullet-native:
	cd $(BUILD); cmake . $(CMAKE_ARGS)
	cd $(BUILD); make -j4
	cd $(BUILD); make install
	cd $(BUILD)/lib; ls -a

install:
	cp -r $(BUILD)/lib $(PREFIX)/lib/native
	cp -r $(BUILD)/src $(PREFIX)/lib/include
	cp -r ammo.js/builds $(PREFIX)/lib/js

