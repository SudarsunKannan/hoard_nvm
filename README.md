Usage
======

Assumes your persistent storage is mounted in /mnt/pmfs

cd code/src

./compile_install_hoard.sh "mmap_type" bytes

mmap_type options:

MAP_DRAM or MAP_MNEMOSYNE or MAP_PMFS or MAP_RAMFS or MAP_PVMAP


#Make sure to mount the appropriate storage medium


#More detailed documentation and python based scripts when I get time/graduate :)
# For more info about the allocator, look into hoard documentation
