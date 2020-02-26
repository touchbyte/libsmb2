export CFLAGS="-fembed-bitcode -fapplication-extension"
export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension"
mkdir ~/Desktop/libsmb2
export PREFIX="$HOME/Desktop/libsmb2"
autoreconf -i
make clean
./iconfigure x86_64 --without-libkrb5 --disable-werror
make
make install
make clean
./iconfigure i386 --without-libkrb5 --disable-werror
make
make install
make clean
./iconfigure arm64 --without-libkrb5 --disable-werror
make
make install
make clean
./iconfigure armv7 --without-libkrb5 --disable-werror
make
make install
make clean
cd ~/Desktop/libsmb2/iphonesimulator-13.2/x86_64/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/iphonesimulator-13.2/i386/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/iphoneos-13.2/arm64/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/iphoneos-13.2/armv7/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/
lipo -create iphonesimulator-13.2/x86_64/lib/libsmb2.3.dylib iphonesimulator-13.2/i386/lib/libsmb2.3.dylib iphoneos-13.2/arm64/lib/libsmb2.3.dylib iphoneos-13.2/armv7/lib/libsmb2.3.dylib -output libsmb2.3.dylib