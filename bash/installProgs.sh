#!/bin/sh

# Installs apps
installer_command="pacman -S"
list_apps=( 
	ranger # vim based file browser
)

sudo $installer_command ${list_apps[@]}

