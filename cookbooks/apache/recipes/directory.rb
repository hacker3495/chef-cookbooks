directory "/var/www/<%= @server_name%>" do
	owner 'www-data'
	group 'www-data'
	action :create
end