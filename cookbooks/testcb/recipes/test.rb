#
# Cookbook:: testcb
# Recipe:: test
#
# Copyright:: 2021, The Authors, All Rights Reserved.
file "/home/sumit/test.txt" do
content "Test file"
action :create
end

execute "run a script" do
command <<-EOH
rm -rf /home/sumit/chef-test
rm -rf /home/sumit/test.txt
EOH
action :run
end
