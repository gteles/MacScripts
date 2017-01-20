#!/bin/sh

#Change these variables to match token and destination paths!

cylanceToken="YOUR TOKEN HERE"
cylancePackageName="CylancePROTECT.zip"
cylancePackageLocation="PACKAGE LOCATION"
cylancePackageAndTokenDestination="/private/tmp/Cylance/"

#Check if destination exists and/or create it!

if [ ! -d "$cylancePackageAndTokenDestination" ]; then
echo "Location doesn't exist.  Creating directory"
mkdir $cylancePackageAndTokenDestination
echo "$cylancePackageAndTokenDestination created"
fi

#Copy file from a location or deploy with munki
# SMB copy
# Curl
# Xcopy

#Don't change nothing more!

echo "$cylanceToken" > "$cylancePackageAndTokenDestination/cyagent_install_token"


#unzip package installer

unzip "$cylancePackageAndTokenDestination/""$cylancePackageName" -d "$cylancePackageAndTokenDestination"

#Install Cylance

sudo installer -pkg /private/tmp/Cylance/CylancePROTECT.pkg -target /

#Delete Cylance folder

rm -rf "$cylancePackageAndTokenDestination"