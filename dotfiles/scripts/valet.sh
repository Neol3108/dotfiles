echo "Installing Valet"

composer global require laravel/valet
valet install
valet trust

if [ ! -d "${HOME}/sites" ]; then
    OLD=$PWD
    mkdir ~/sites && cd ~/sites
    valet park
    cd $OLD
fi

if [ ! -d "${HOME}/.config/valet/Sites/phpinfo" ]; then
    mkdir ~/.config/valet/Sites/phpinfo
    touch ~/.config/valet/Sites/phpinfo/index.php
    echo "<?php phpinfo(); exit;" >> ~/.config/valet/Sites/phpinfo/index.php
    cd ~/.config/valet/Sites
    valet park
    cd $OLD
fi

