execute 'sudo apt-add-repository ppa:jtaylor/keepass'
package('keepass2')

# Dropbox
execute 'sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E'
execute 'sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu raring main'
package('nautilus-dropbox')

execute 'cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -'
execute "~/.dropbox-dist/dropboxd"