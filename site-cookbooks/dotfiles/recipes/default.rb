#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git node['user']['home'] + "/github/fukayatsu/dotfiles" do
  user node['user']['name']
  group node['user']['group']
  repository "git://github.com/fukayatsu/dotfiles.git"
  reference "master"
  action :checkout
end

bash "setup-dotfiles" do
  user node['user']['name']
  group node['user']['group'] 
  cwd node['user']['home']
  environment "HOME" => node['user']['home']

  code <<-EOC
    cd ~/github/fukayatsu/dotfiles
    ./symlink.sh
  EOC
end
