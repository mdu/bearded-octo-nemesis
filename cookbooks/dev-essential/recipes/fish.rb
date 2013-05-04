package("autoconf")
package("libncurses5-dev")
package("libncursesw5-dev")

fishDir = '/usr/local/bin/fish'

if File.exists?(fishDir)
	puts "Found fish shell at " + fishDir
else
	git "/tmp/fish" do
	  repository "https://github.com/fish-shell/fish-shell.git"
	  reference "master"
	  action :sync
	end

	execute "autoconf;./configure;make;make install" do
		cwd '/tmp/fish'
	end
end