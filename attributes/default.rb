default['firewall']['allow_ssh'] = true

default['lamp']['firewall_open_ports'] = [80, 443, 3306]

default['lamp']['web_listen_ports'] = ['80', '443']
default['lamp']['web_run_user'] = default['httpd']['run_user']
default['lamp']['web_run_group'] = default['httpd']['run_group']

default['lamp']['database_root_pass'] = 'root'

default['lamp']['remoteuser'] = false

