package("git")
package("gitk")
package("git-gui")
package("vim")

# Install Sublime and Chrome
execute "add-apt-repository ppa:webupd8team/sublime-text-2"

execute "wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -"
apt_repository "google-chrome" do
  uri "http://dl.google.com/linux/chrome/deb/"
  components ["stable", "main"]
end

execute "apt-get update"

package("sublime-text")
package("google-chrome-stable")

