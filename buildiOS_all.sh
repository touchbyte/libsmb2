export CFLAGS="-fembed-bitcode -fapplication-extension"
export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension"
mkdir ~/Desktop/libsmb2_new
export PREFIX="$HOME/Desktop/libsmb2_new"
autoreconf -i

#make clean
#export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension"
#CHOST=x86_64-apple-darwin SDK=iphonesimulator ./iconfigure x86_64 --without-libkrb5 --disable-werror
#make
#make install

#make clean
#export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension -miphonesimulator-version-min=13.0"
#CHOST=arm-apple-darwin SDK=iphonesimulator TARGET=arm64-apple-ios13.0-simulator ./iconfigure arm64 --without-libkrb5 --disable-werror
#make
#make install

#make clean
#export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension"
#./iconfigure arm64 --without-libkrb5 --disable-werror
#make
#make install
#exit

#make clean
#export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension"
#./iconfigure armv7 --without-libkrb5 --disable-werror
#make
#make install
#make clean
#exit

make clean
export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension -Xlinker -platform_version -Xlinker mac-catalyst -Xlinker 13.1 -Xlinker 14.0"
export CHOST=x86_64-apple-darwin SDK=macosx TARGET=x86_64-apple-ios13.1-macabi 
./iconfigure x86_64 --without-libkrb5 --disable-werror
make
make install
exit

#make clean
#export LDFLAGS="-Wc,-fembed-bitcode,-fapplication-extension -Xlinker -platform_version -Xlinker mac-catalyst -Xlinker 13.1 -Xlinker 14.0 -target arm64-apple-ios13.1-macabi"
#export CHOST=aarch64-apple-darwin22 SDK=macosx TARGET=arm64-apple-ios13.1-macabi 
#./iconfigure arm64 --without-libkrb5 --disable-werror
#make
#make install
#exit

cd ~/Desktop/libsmb2/iphonesimulator-13.4/x86_64/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/iphonesimulator-13.4/i386/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/iphoneos-13.4/arm64/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/iphoneos-13.4/armv7/lib
install_name_tool -id @rpath/libsmb2.framework/libsmb2 libsmb2.3.dylib
cd ~/Desktop/libsmb2/
#lipo -create iphonesimulator-13.4/x86_64/lib/libsmb2.3.dylib iphonesimulator-13.4/i386/lib/libsmb2.3.dylib iphoneos-13.4/arm64/lib/libsmb2.3.dylib iphoneos-13.4/armv7/lib/libsmb2.3.dylib -output libsmb2.3.dylib