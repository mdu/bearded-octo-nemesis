arch = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i386"

package("curl")
package("git")
package("gitk")
package("vim")
package("git-gui")

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
  if arch == 'i386'
    remote_file '/tmp/libudev0_175.deb' do
      source 'https://launchpad.net/ubuntu/+source/udev/175-0ubuntu19/+build/4325790/+files/libudev0_175-0ubuntu19_i386.deb'
    end
  else
    remote_file '/tmp/libudev0_175.deb' do
      source 'http://mirrors.us.kernel.org/ubuntu//pool/main/u/udev/libudev0_175-0ubuntu13_amd64.deb'
    end
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

# Update repo - this is done automatically after apt_repo
# execute "apt-get update"

package("sublime-text")
package("google-chrome-stable")
package("mongodb-10gen")

package("libzmq1")
package("libzmq-dev")
execute "ldconfig"

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
package("redis-server")

# Install CoffeeScript
#execute "npm install coffee-script -g"
# user "username
#    action :run

# tmux
package("tmux")

template "#{ENV['HOME']}/.tmux.conf" do
  source "tmux.conf.erb"
  mode 0664
end

# JDK
package('openjdk-7-jre-headless')
