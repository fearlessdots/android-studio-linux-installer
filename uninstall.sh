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

ERROR=0

#if [ ! -f $ICON_LOCATION/android-studio.png ]
#then
#	show_attention "Icon file not found as $ICON_LOCATION/android-studio.png"
#	ERROR=1
#else
#	show_success "Removing icon file at $ICON_LOCATION"
#	rm $ICON_LOCATION/android-studio.png
#fi

if [ ! -f $DESKTOP_FILE_LOCATION/android-studio.desktop ]
then
	show_attention "Desktop file not found as $DESKTOP_FILE_LOCATION/android-studio.desktop"
	ERROR=1
else
	show_success "Removing desktop file at $DESKTOP_FILE_LOCATION"
	rm $DESKTOP_FILE_LOCATION/android-studio.desktop
fi

if [ ! -d $INSTALL_LOCATION ]
then
	show_attention "Program directory not found at $INSTALL_LOCATION"
	ERROR=1
else
	show_success "Removing program directory at $INSTALL_LOCATION"
	rm -rf $INSTALL_LOCATION
fi

show_info "Optionally, delete all user data for the Android Studio manually."

finish_program $ERROR


