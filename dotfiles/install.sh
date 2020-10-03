SCRIPTS=(
  "brew"
)

for script in $SCRIPTS; do
    [ -f "scripts/$script.sh" ] || break
    read -p "Do you want to install $script?" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo
        sh scripts/$script.sh
    else
        echo
        echo "Skipping $script"
    fi
done

echo "All installer scripts ran. Enjoy!"
