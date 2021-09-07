#
# Cookbook:: test-attribute
# Recipe:: runlist2
#
# Copyright:: 2021, The Authors, All Rights Reserved.
file "/home/sumit/runlist2.txt" do
content "runlist2"
action :create
end
