# Keepass
execute 'sudo apt-add-repository ppa:jtaylor/keepass'
package('keepass2')
package('xdotool')

# Dropbox
execute 'sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E'
execute 'sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu raring main"'
package('nautilus-dropbox')
execute 'dropbox autostart y'