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
  "mongodb-compass"
  "notion"
  "phpstorm"
  "poedit"
  "tableplus"
  "insomnia"
  "minio"
  "xcode"
  "spotify"
  "whatsapp"
  "zoomus"
)

for script in $SCRIPTS; do
    echo "scripts/$script.sh"
    [ -f "scripts/$script.sh" ] || break
    read -p "Do you want to install $script? [Y/n] " -n 1 -r
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

read -p "Do you want to setup default MacOS preferences? [Y/n] " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Disabling automatic space rearrangement based on most recently used."
    defaults write com.apple.dock mru-spaces -bool false;

    echo
    echo "Preferences setup :-)"
else
    echo "Skipping preferences setup"
fi

