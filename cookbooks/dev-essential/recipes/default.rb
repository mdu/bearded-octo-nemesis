package("curl")
package("git")
package("gitk")
package("git-gui")
package("vim")

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


apt_repository "10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end

execute "apt-get update"

package("sublime-text")
package("google-chrome-stable")
package("mongodb-10gen")
package("libzmq1")
execute "ldconfig"

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

# Install MongoDB