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
  code <<-EOC
    cd ~/github/fukayatsu/dotfiles
    sudo -u fukayatsu ./symlink.sh
  EOC
end
