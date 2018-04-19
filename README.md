# ct-ng-configs
Installation:
```
wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.23.0.tar.xz
tar xf crosstool-ng-1.23.0.tar.xz
cd crosstool-ng-1.23.0
./configure --prefix=/opt/crosstool-ng
make -j4
sudo make install
sudo cp ct-ng.comp /etc/bash_completion.d/
cd ..
```
Start building the crosstool:
```
git clone https://github.com/badbat75/ct-ng-configs
cd ct-ng-configs
sudo cp ct-ng.files/ct-ng.sh /etc/profile.d/

source /etc/profile.d/ct-ng.sh
source /etc/bash_completion.d/ct-ng.comp

DEFCONFIG=./rpi.config ct-ng defconfig
ct-ng menuconfig
ct-ng build
```
Use the crosstool platform:
```
export CC=/opt/x-tools/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-gcc
export CPP=/opt/x-tools/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-g++
```
Use the crosstool to build kernels:
```
make \
  ARCH=arm \
  CROSS_COMPILE=/opt/x-tools/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf- \
  KBUILD_DEFCONFIG=vexpress_defconfig \
  defconfig
make \
  ARCH=arm \
  CROSS_COMPILE=/opt/x-tools/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf- \
  menuconfig
make -j2 -k\
  ARCH=arm \
  CROSS_COMPILE=/opt/x-tools/arm-rpi-linux-gnueabihf/bin/arm-rpi-linux-gnueabihf-
```
