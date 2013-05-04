package("curl")
package("git")
package("gitk")
package("vim")
if node[:platform_version] == '13.04'
  puts 'Skipping git-gui'
else
  package("git-gui")
end

# Install Sublime repo
execute "add-apt-repository -y ppa:webupd8team/sublime-text-2"

# ZeroMQ
execute "add-apt-repository -y ppa:chris-lea/zeromq"

# Chrome
execute "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -"
apt_repository "google-chrome" do
  uri "http://dl.google.com/linux/chrome/deb/"
  components ["stable", "main"]
end
if node[:platform_version] == '13.04'
  puts 'Installing temporary Chrome stable extra dependency for 13.04'
  # For 13.10
  remote_file '/tmp/libudev0_175.deb' do
    source 'https://launchpad.net/ubuntu/+source/udev/175-0ubuntu19/+build/4325790/+files/libudev0_175-0ubuntu19_i386.deb'
  end
  execute "sudo dpkg -i /tmp/libudev0_175.deb"
end


# MongoDB
apt_repository "10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
end

# Update repo
execute "apt-get update"

package("sublime-text")
package("google-chrome-stable")
package("mongodb-10gen")

if node[:platform_version] == '13.04'
  puts 'Skipping ZeroMQ'
else
  package("libzmq1")
  package("libzmq-dev")
  execute "ldconfig"
end

package("build-essential")
package("openssl")
package("libssl-dev")

# Install n
git "/tmp/n" do
  repository "https://github.com/visionmedia/n.git"
  reference "master"
  action :sync
end
execute "make install" do
	cwd '/tmp/n'
end

# Install Node.js
execute "n 0.8.16"

# Install Redis
if node[:platform_version] == '13.04'
  puts 'Skipping redis-server'
else
  package("redis-server")
end

# Install CoffeeScript
execute "npm install coffee-script -g"

# tmux
package("tmux")