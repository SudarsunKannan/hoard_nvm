#First replace the allocation type
if [ ! $# == 2 ]; then
  echo "Usage: $0 MAP_DRAM or MAP_MNEMOSYNE or MAP_PMFS or MAP_RAMFS or MAP_PVMAP, MAPSIZE"
  exit
fi

maptype=$1
mapsize=$2

compile(){
make clean
make linux-gcc-x86-64
sudo cp libhoard.so /usr/lib/
sudo cp libhoard.so /usr/lib64/
exit
}

sed -i '/#define MAP_DRAM/c\\/\/#define MAP_DRAM' Heap-Layers/wrappers/mmapwrapper.h
sed -i '/#define MAP_MNEMOSYNE/c\\/\/#define MAP_MNEMOSYNE' Heap-Layers/wrappers/mmapwrapper.h
sed -i '/#define MAP_PMFS/c\\/\/#define MAP_PMFS' Heap-Layers/wrappers/mmapwrapper.h
sed -i '/#define MAP_RAMFS/c\\/\/#define MAP_RAMFS' Heap-Layers/wrappers/mmapwrapper.h
sed -i '/#define MAP_PVMAP/c\\/\/#define MAP_PVMAP' Heap-Layers/wrappers/mmapwrapper.h


echo $maptype $mapsize

sed -i '/static unsigned long mapfilesz/c\static unsigned long mapfilesz='$mapsize';' Heap-Layers/wrappers/mmapwrapper.h


if [ $maptype == "MAP_DRAM" ] ; then
sed -i '/\/\/#define MAP_DRAM/c\#define MAP_DRAM' Heap-Layers/wrappers/mmapwrapper.h
compile
fi

if [ $maptype == "MAP_MNEMOSYNE" ] ; then
sed -i '/\/\/#define MAP_MNEMOSYNE/c\#define MAP_MNEMOSYNE' Heap-Layers/wrappers/mmapwrapper.h
compile
fi

if [ $maptype == "MAP_PMFS" ] ; then
sed -i '/\/\/#define MAP_PMFS/c\#define MAP_PMFS' Heap-Layers/wrappers/mmapwrapper.h
compile
fi

if [ $maptype == "MAP_RAMFS" ] ; then
sed -i '/\/\/#define MAP_RAMFS/c\#define MAP_RAMFS' Heap-Layers/wrappers/mmapwrapper.h
compile
fi

if [ $maptype == "MAP_PVMAP" ] ; then
sed -i '/\/\/#define MAP_PVMAP/c\#define MAP_PVMAP' Heap-Layers/wrappers/mmapwrapper.h
compile
fi

echo "Usage: $0 MAP_DRAM or MAP_MNEMOSYNE or MAP_PMFS or MAP_RAMFS or MAP_PVMAP, MAPSIZE"
exit

#compile and install hoard

