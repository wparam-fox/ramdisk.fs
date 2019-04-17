# ramdisk.fs
Macos filesystem to make ramdisks easier

Meant to be used the same say you'd say `mount -t tmpfs` on linux.  Handles creating the block device, formatting, and mounting all internally, and will clean up the disk device when the mount goes away.

To install:

```
sudo mkdir -p /Library/Filesystems/ramdisk.fs/Content/Resources
cp * /Library/Filesystems/ramdisk.fs/Content/Resources
```

After that, you should be able to `mount -t ramdisk foobar /path`.  Usage info:

```
Usage: mount -t ramdisk -o [options] /dev/diskname /mountpoint
Options:
  size=XXX       Set fs size. Supports k, m, g, etc. suffixes
  ro             Mount readonly.  Useful with initrd option
  initrd=tarfile Extract tarfile after mounting
  nobrowse       Hide from finder
  nomount        Do not mount disk after creation
  nowatch        Do not watch for disk deletion. (NOTE: This
                 will cause the disk to remain after unmount)
  autoclean      Automatically delete old files from target disk
  cleantime=XXm  Sets how old files must be before deletion
```

Bug Note:  Tested and working on El Capitan, but the auto disk cleanup may be broken under Mojave.
