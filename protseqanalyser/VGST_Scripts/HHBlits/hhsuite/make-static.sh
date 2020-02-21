rm -rf build
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/home/mmeier/opt/hh-suite -DHAVE_SSSE3=1 -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_EXE_LINKER_FLAGS_RELEASE=-static -static-libgcc -static-libstdc++ -DCMAKE_FIND_LIBRARY_SUFFIXES=.a ..
make -j 16
make package
make package_source

cd ..
