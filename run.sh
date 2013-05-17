#!/bin/bash

if hash chef-solo 2>/dev/null; then
    echo "Found chef-solo"
else
    echo "Installing chef-solo..."

    . /etc/lsb-release

    sudo apt-get install curl
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi

echo "Installing everything else..."
cd `dirname $0`
sudo chef-solo -c config/solo.rb -j config/node.json