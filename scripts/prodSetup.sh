#!/bin/bash

env="prod"
color="\033[0;32m"  # Green
reset="\033[0m"

echo ""
echo -e "${color}---------------------------------------------------"
echo -e "---------------- Android App Build -----------------"
echo -e "---------------------------------------------------${reset}"
echo ""

echo -e "${color}* Creating release app bundle for $env environment${reset}"

# Replace Firebase config file
echo -e "${color}* Replacing Firebase config file${reset}"
cp ./android/app/google-services.$env.json ./android/app/google-services.json

# Clean previous build
echo -e "${color}* Executing command: ./gradlew clean${reset}"
cd android
./gradlew clean
cd ..

echo -e "${color}* Setup complete. Ready for build.${reset}"
