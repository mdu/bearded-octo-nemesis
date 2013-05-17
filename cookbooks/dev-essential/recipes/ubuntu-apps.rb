# Keepass
execute 'sudo apt-add-repository ppa:jtaylor/keepass'
package('keepass2')
package('xdotool')

# Dropbox
execute 'sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E'
execute 'sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu raring main"'
package('nautilus-dropbox')
execute 'dropbox autostart y'

# Hipchat
execute 'echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list'
execute 'wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -'
execute "apt-get update"
package('hipchat')

# Skype
execute 'add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"'
execute "apt-get update"
package('skype')

#CCSM
package('compizconfig-settings-manager')

package('meld')

package('xclip')