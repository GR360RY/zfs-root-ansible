TODO
====

* When using rync, make sure all file systems on root drive are copied ( brakes in case of boxcutter/ubuntu1404-desktop, as /boot defined in separate partition). Probably all mounted volumes on original non zfs file systems should be remounted together with root bind mount.
( Add `mount --bind /boot /mnt/tmp/boot`)
* Exit playbook when EFI mode is detected and show Warining

Boot metrics
============

* Boot with --no-provision with downloaded vagrant box: 30s
* Boot with downloaded vagrant box ( including provisioning ): 4min 48s
