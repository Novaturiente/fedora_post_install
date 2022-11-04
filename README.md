# fedora_setup

This script is to make fedora post installation setup easier

This will remove most of the preloaded applications and make dnf faster(check the dnf.conf to see the details of the configuration). Also this enables the RPM fusion repositories and install media plugins so that audio and video are played properly.

In the setup.sh script under #Removing pre-installed packages you can select which packages you need to remove and under #Install packages you can choose which additional packages/applications that you need to include
 
Usage:

git clone https://github.com/Novaturiente/fedora_setup.git

chmod +x setup.sh

./setup.sh
