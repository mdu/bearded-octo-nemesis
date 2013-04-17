echo "Installing Chef..."
sudo apt-get install -y chef

echo "Installing everything else..."
cd `dirname $0`
sudo chef-solo -c config/solo.rb -j config/node.json