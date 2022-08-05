# Change Repo

### A script to Change your Repository Links inside Termux

![ico](https://img.shields.io/badge/status-unstable-red) ![imgs](https://img.shields.io/badge/project_status-unfinished-red)

**Warning!**

This Script is still in unstable state, so again. Expect Bugs.

### Goals:

* [X] Release
* [ ] Chinese Support
* [ ] Stabilization Improvements
* [ ] Better Help Guide
* [ ] Multiple Repo Injections
* [X] Custom Repo Injections
* [ ] Supports Fake Linux Environment (`proot-distro` distributions)
* [ ] Remove Bloat
* [ ] Add an Update Script

### Usages

`--help   -h` - Shows Help

`-r --readline` - Use Script only without Terminal Interface Packages: `dialog`

`--clear-key-cache --clear-cache --del-key --remove-key -rmk` - Remove Keyring, this feature will make the Permission Alerts Pop-up again.

### Permissions

* **Modify Files/Folders**
  The following Files will be Modified:
  `Termux $HOME`
  `Git Repo Location`
* ⚠️ **Modify Termux-Level Files/Folders**
  The following Files and Folders will be Modified
  `$PREFIX/etc/apt`

## Support

If you're in trouble, dont forget to ask on [Issues](https://github.com/SUFandom/change-repo/issues) Tab
