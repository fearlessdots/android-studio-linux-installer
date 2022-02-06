#!/bin/bash

INSTALL_LOCATION='/opt/android-studio'
DESKTOP_FILE_LOCATION='/usr/share/applications'
#ICON_LOCATION='/usr/share/icons/hicolor/48x48/apps'

# Shell display functions
show_info(){
	echo "$(tput setaf 26)[  AndroidStudioInstaller  ]$(tput sgr0) $(tput setaf 250)$1$(tput sgr0)"
}

show_attention()
{
	echo "$(tput setaf 9)[ ATTENTION ]$(tput sgr0) $(tput setaf 7)$1$(tput sgr0)"
}

show_success(){
	echo "$(tput setaf 14)[ SUCCESS ]$(tput sgr0) $(tput setaf 26)$1$(tput sgr0)"
}

finish_program()
{
	# $1 is the exit code
	exit $1
}

#
##
#

DOWNLOAD_DIR=$(pwd)
echo $DOWNLOAD_DIR

LATEST_VERSION=$(cat android-studio/about | grep latest_version | awk '{print $2}')

mkdir $INSTALL_LOCATION $INSTALL_LOCATION/download
cd $INSTALL_LOCATION/download

show_info "Downloading latest version ($LATEST_VERSION) for Android Studio."
wget https://dl.google.com/dl/android/studio/ide-zips/$LATEST_VERSION/android-studio-$LATEST_VERSION-linux.tar.gz

show_info "Extracting the archive file to the default installation location at $INSTALL_LOCATION."
sleep 2
zcat $INSTALL_LOCATION/download/android-studio-$LATEST_VERSION-linux.tar.gz | tar xvf -
cp -R android-studio/* $INSTALL_LOCATION
rm -rf $INSTALL_LOCATION/download

#show_info "Copying the icon file to $ICON_LOCATION"
#cp $DOWNLOAD_DIR/android-studio/android-studio.png $ICON_LOCATION

show_info "Copying the desktop file to $DESKTOP_FILE_LOCATION."
cp $DOWNLOAD_DIR/android-studio/android-studio.desktop $DESKTOP_FILE_LOCATION

show_success "Android Studio succesfuly installed. Optionally, you can add $INSTALL_LOCATION/android-studio/bin to your PATH environment variable."

finish_program 0
