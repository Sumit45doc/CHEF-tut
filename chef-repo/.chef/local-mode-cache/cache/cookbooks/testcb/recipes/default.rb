#
# Cookbook:: testcb
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe "testcb::runlist1"
include_recipe "testcb::defineuser"
include_recipe "testcb::test"

