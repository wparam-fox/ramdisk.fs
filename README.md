# ramdisk.fs
Macos filesystem to make ramdisks easier

Meant to be used the same say you'd say `mount -t tmpfs` on linux.  Handles creating the block device, formatting, and mounting all internally, and will clean up the disk device when the mount goes away.

To install:

```
sudo mkdir -p /Library/Filesystems/ramdisk.fs/Content/Resources
cp * /Library/Filesystems/ramdisk.fs/Content/Resources
```

After that, you should be able to `mount -t ramdisk foobar /path`.

Bug Note:  Tested and working on El Capitan, but the auto disk cleanup may be broken under Mojave.
