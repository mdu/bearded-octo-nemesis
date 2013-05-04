# Install n
git "/tmp/fish" do
  repository "https://github.com/fish-shell/fish-shell.git"
  reference "master"
  action :sync
end

execute "autoconf;./configure;make;make install" do
	cwd '/tmp/fish'
end
