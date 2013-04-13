package("git")
package("gitk")
package("git-gui")
package("vim")

apt_repository "sublime-ppa" do
  uri "http://ppa.launchpad.net/webupd8team/sublime-text-2/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
end

