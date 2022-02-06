# android-studio-linux-installer
An unofficial Android Studio installer for Linux systems.

## Installation

**Note:** this script neither install any dependencies nor change your *PATH* environment variable. You will need to do this manually: before installing Android Studio in the former case, and after the installation in the latter case.

To install Android Studio on your system, run **`sudo ./install.sh`**. The default installation directory is */opt/android-studio*. You can change it by editing the *install.sh* and *android-studio.desktop* files.

When running the installation script, it will download the latest version as listed in the */android-studio/about* file. I haven't found any way (in Bash) to automatically check for the latest release. I will add this feature as soon as I find a way to do that.

# Updating

Since this repository not will always include the latest version of the program, the best way to update the Android Studio is by clicking on the “check for updates” button available in the IDE.

## Uninstall

To uninstall the program, run **`sudo ./uninstall.sh`**. If you have changed the default installation directory, you will also need to change the variable values in the uninstallation script accordingly.
