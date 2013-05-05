username = Chef::Config[:username]
# Install Sublime packages
#execute "wget -P #{installdir} 'https://sublime.wbond.net/Package%20Control.sublime-package'"

sublime_dir = "#{ENV['HOME']}/.config/sublime-text-2/Installed Packages/"

directory "#{sublime_dir}" do
  owner username
  group username
  recursive true
  action :create
end

remote_file sublime_dir+'/Package Control.sublime-package' do
  source 'https://sublime.wbond.net/Package%20Control.sublime-package'
  mode "0644"
  owner username
  group username
end

execute "chown -Rf mason:mason #{ENV['HOME']}/.config"
