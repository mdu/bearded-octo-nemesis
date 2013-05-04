#!/bin/bash

if hash chef-solo 2>/dev/null; then
    echo "Found chef-solo"
else
    echo "Installing chef-solo..."

    . /etc/lsb-release

    if [ "$DISTRIB_RELEASE" == "13.04" ]; then
        sudo wget -P /tmp/ 'https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/i686/chef_11.4.4-1.ubuntu.11.04_i386.deb'
        sudo dpkg -i /tmp/chef_11.4.4-1.ubuntu.11.04_i386.deb
    else
        sudo apt-get install curl
        curl -L https://www.opscode.com/chef/install.sh | sudo bash
    fi
fi

echo "Installing everything else..."
cd `dirname $0`
sudo chef-solo -c config/solo.rb -j config/node.json