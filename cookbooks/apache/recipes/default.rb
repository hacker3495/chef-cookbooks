#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'apache2' do
	action :install
end

directory "/var/www/#{node[:app][:server_name]}" do
	owner 'www-data'
	group 'www-data'
	action :create
end

template "/etc/apache2/sites-available/#{node[:app][:server_name]}.conf" do
	source "vhost.erb"
	variables(:server_name => node[:app][:server_name])
end

link "/etc/apache2/sites-enabled/#{node[:app][:server_name]}.conf" do
	to "/etc/apache2/sites-available/#{node[:app][:server_name]}.conf"
end

service "apache2" do
	action :restart
end
