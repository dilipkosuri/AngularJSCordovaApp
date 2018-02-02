#!/bin/bash
# Clean project file
device_logo(){
echo "                                                      "
echo ":-------:                :--------------------:       "
echo "|   -   |                :                    :       "
echo "|       |                :                    :       "
echo "|iPhone |                :       mac          :       "
echo "|       |                :                    :       "
echo "|-------|                :                    :       "
echo "|  (o)  |        ::-----::                    :       "
echo ":--::---:        |       |--------------------|       "
echo "   ||            |      ,,,,,,,,,,,,,,,,,,,,,,,,      "
echo "    -------------    ;;:::::::::::::;;:::::::::::::   "
echo "                    :;;;;::::::::::;;;;:::::::::::::  "
}

MOBILE_IOS_ROOT=${PWD}
result=${PWD}
result=$(dirname "$result")
result=$(dirname "$result")
REPO_ROOT=$(dirname "$result")
APP_REPO_ROOT="$REPO_ROOT/frontend-ui"

device_logo

echo -e "Removing previous xcarchive and ipa files"
rm -rf ./pii_archive.xcarchive
rm -rf ./pii_build.ipa

#if [ -d "$APP_REPO_ROOT" ]; then
#  echo -e "\033[0;32mFound the app in \033[1;33m$APP_REPO_ROOT"
#  cd $APP_REPO_ROOT
#  echo -e "\033[0;34mBuilding Send Money Module\033[37m"
#  grunt build:sendmoney:my:ios --env=apidev
#  cd dist
#  echo -e "\033[0;34mCopying send money to \033[1;33mmobileMY/ios/iPhone/www\033[37m"
#  cp -a sendmoney/. $MOBILE_IOS_ROOT/www
#  cd $MOBILE_IOS_ROOT
 # echo -e "\033[0;34mBuilding IPA\033[37m"
  # Create an archive
  xcodebuild -configuration "Debug clean build" -scheme "PiiApp" -archivePath "./pii_archive.xcarchive" -destination generic/platform=iOS archive
  # Create the IPA file from the archive
  xcodebuild -exportProvisioningProfile "iOS Team Provisioning Profile: com.sc.pii.simulate" -exportArchive -exportFormat IPA -archivePath "./pii_archive.xcarchive" -exportPath "./pii_build.ipa" CODE_SIGN_IDENTITY="iPhone Developer: rwb.scsg@gmail.com (8EU543C6A8)"
ios-deploy --bundle pii_build.ipa
 # echo -e "\033[0;34mBThe IPA is located in current directory\033[37m"
#else
  # enter if Path does not exists.
#  echo -e -n "\033[5;31mError!!\033[0;31m I couldn't find the mobile app path at $APP_REPO_ROOT could you please provide the full path\033[37m\033[33m(e.g: /Users/test/picasso) ?\033[32m "
 # read answer
 # REPO_ROOT="$answer"
 # APP_REPO_ROOT="$REPO_ROOT/frontend-ui"
 # MOBILE_IOS_ROOT="$REPO_ROOT/mobileMY/ios/iPhone"
 # if [ -d "$APP_REPO_ROOT" ]; then
 #   echo -e "\033[0;32mFound the app in \033[1;33m$APP_REPO_ROOT"
 # 	cd $APP_REPO_ROOT
 # 	echo -e "\033[0;34mBuilding Send Money Module\033[37m"
# 	 grunt build:sendmoney:my:ios --env=apidev
#  	cd dist
#  	echo -e "\033[0;34mCopying send money to \033[1;33mmobileMY/ios/iPhone/www\033[37m"
#  	cp -a sendmoney/. $MOBILE_IOS_ROOT/www
#  	cd $MOBILE_IOS_ROOT
#  	echo -e "\033[0;34mBuilding IPA\033[37m"
#  	# Create an archive
#  	xcodebuild -configuration "Debug clean build" -scheme "Breeze MY" -archivePath "./Breeze.xcarchive" archive
#  	# Create the IPA file from the archive
#  	xcodebuild -exportProvisioningProfile "Bamboo wildcard" -exportArchive -exportFormat IPA -archivePath "./Breeze.xcarchive" -exportPath "./BreezeMobile.ipa" CODE_SIGN_IDENTITY="iPhone Developer: Karthik Chandrasekaran (LL82K2CA2B)"
#  	echo -e "\033[0;34mBThe IPA is located in current directory\033[37m"
#  else
#    echo -e "\033[5;31mInvalid\033[0;31m Directory Name, Please check if the following path exists\033[37m"
#    echo $REPO_ROOT
#  fi
#fi
#




