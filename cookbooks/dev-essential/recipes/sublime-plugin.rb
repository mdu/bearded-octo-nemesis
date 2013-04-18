username = Chef::Config[:username]
# Install Sublime packages
#installdir = '/home/' + username + '/.config/sublime-text-2/Installed Packages'
#execute "mkdir -p #{installdir}"
#execute "wget -P #{installdir} 'https://sublime.wbond.net/Package%20Control.sublime-package'"

sublime_dir = Chef::Config[:home_dir] + '.config/sublime-text-2/Installed Packages/'

remote_file sublime_dir+'/Package Control.sublime-package' do
  source 'https://sublime.wbond.net/Package%20Control.sublime-package'
  mode "0644"
  owner username
  group username
end
