#! /usr/bin/env bash

########################################################################################################################
##                                      Vagrant Oh My Zsh BASH Script                                                 ##
########################################################################################################################

#THEME=agnoster


echo -e "\n--- Install Zsh and Git packages ---\n"
apt-get -y install zsh git-core >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Download and run the Oh-my-Zsh-Installscript ---\n"
mkdir zsh
wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O zsh/install.sh
sudo -u vagrant -H sh -c "bash zsh/install.sh" >> /vagrant/logs/vm_build.log 2>&1
rm -rf zsh

echo -e "\n--- Set Zsh as default ---\n"
sudo chsh -s /bin/zsh vagrant

echo 'if [ "$SHELL" != "/usr/bin/zsh" -a -n "$SSH_TTY" -a -x /usr/bin/zsh ]; then
    export SHELL="/usr/bin/zsh"
    exec $SHELL -l
fi' >> /home/vagrant/.profile

# echo -e "\n--- Install Powerline fonts for Agnoster Theme ---\n"
# git clone https://github.com/powerline/fonts.git
# sudo -u vagrant -H sh -c "bash fonts/install.sh"
# rm -rf fonts

#echo -e "\n--- Set Theme to $THEME ---\n"
#sed -i "s/^\(ZSH_THEME\s*=\s*\).*\$/\1$THEME/" /home/vagrant/.zshrc
