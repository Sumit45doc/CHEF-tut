#
# Cookbook:: testcb
# Recipe:: test
#
# Copyright:: 2021, The Authors, All Rights Reserved.
file "/home/sumit/test.txt" do
content "Test file"
action :create
end