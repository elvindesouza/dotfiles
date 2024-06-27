################ Script WIP #########################

# point this file to the correct firefox profile directory
# ln -s user-overrides.js /home/elvin/.mozilla/firefox/arkenfox/user-overrides.js 

# script to install arkenfox
download_arkenfox() {
    echo "Downloading the latest Arkenfox release..."
    LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/arkenfox/user.js/releases/latest | grep "tarball_url" | cut -d '"' -f 4)
    curl -L $LATEST_RELEASE_URL -o arkenfox.tar.gz
    tar -xzf arkenfox.tar.gz
}

# move relevant files to the Firefox profile root directory
move_files() {
    EXTRACTED_FOLDER=$(find . -maxdepth 1 -type d -name "arkenfox-user.js-*" -print -quit)
    echo "Moving relevant files to $PROFILE_DIR..."
    cp $EXTRACTED_FOLDER/prefsCleaner.js $PROFILE_DIR/
    cp $EXTRACTED_FOLDER/updater.sh $PROFILE_DIR/
    cp $EXTRACTED_FOLDER/user.js $PROFILE_DIR/
}

read -p "Enter the Firefox profile root directory: " PROFILE_DIR

if [ ! -d "$PROFILE_DIR" ]; then
    echo "Profile does not exist"
    exit 1
fi

download_arkenfox
move_files
rm -rf arkenfox.tar.gz $EXTRACTED_FOLDER
echo "arkenfox files have been moved to $PROFILE_DIR."

echo "Applying arkenfox updater. Make sure Firefox is closed."
cd $PROFILE_DIR
./updater.sh
./prefsCleaner.sh
