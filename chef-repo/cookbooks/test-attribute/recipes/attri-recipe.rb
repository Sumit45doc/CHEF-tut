#
# Cookbook:: test-attribute
# Recipe:: attri-recipe
#
# Copyright:: 2021, The Authors, All Rights Reserved.
file "/home/sumit/attri.txt" do
content "This is some info about node IP-ADRESS: #{node["ipaddress"]}. Here ##{} denotes attribute"
action :create
end

