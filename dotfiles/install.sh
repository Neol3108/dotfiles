SCRIPTS=(
  "brew"
  "iterm"
  "oh-my-zsh"
  "tmux"
  "tpm"
  "docker"
  "1password"
  "google-chrome"
  "harvest"
  "slack"
  "mongodb"
  "mongodb-compass"
  "notion"
  "phpstorm"
  "poedit"
  "tableplus"
  "insomnia"
  "awscli"
  "minio"
  "php"
  "composer"
  "mysql"
  "valet"
  "xcode"
  "spotify"
  "whatsapp"
  "zoomus"
)

for script in "${SCRIPTS[@]}"; do
    echo "scripts/${script}.sh"
    [ -f "scripts/$script.sh" ] || continue
    read -p "Do you want to install $script? [Y/n] " -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sh scripts/$script.sh
    else
        echo "Skipping $script"
    fi
done

echo
echo "All installer scripts ran. Enjoy!"
echo

read -p "Do you want to setup default MacOS preferences? [Y/n] " -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Disabling automatic space rearrangement based on most recently used."
    defaults write com.apple.dock mru-spaces -bool false;

    echo "Showing current path in finder"
    defaults write com.apple.finder ShowPathbar -bool true

    echo "Allowing finder to quit with CMD + Q"
    defaults write com.apple.finder QuitMenuItem -bool true

    echo "Showing all extensions"
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    echo "Disable the \"Are you sure you want to open this application?\" dialog"
    defaults write com.apple.LaunchServices LSQuarantine -bool false

    echo "Trackpad: map bottom right corner to right-click"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

    echo "Disable press-and-hold for keys in favor of key repeat"
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

    echo "Set a blazingly fast keyboard repeat rate"
    defaults write NSGlobalDomain KeyRepeat -int 1
    defaults write NSGlobalDomain InitialKeyRepeat -int 10

    echo "Keep folders on top when sorting by name"
    defaults write com.apple.finder _FXSortFoldersFirst -bool true

    echo "Disable the warning when changing a file extension"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    echo
    echo "Preferences setup :-)"
else
    echo "Skipping preferences setup"
fi

