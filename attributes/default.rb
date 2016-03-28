default['firewall']['allow_ssh'] = true

default['lamp']['firewall_open_ports'] = [80, 443, 3306]

default['lamp']['web_listen_ports'] = ['80', '443']
default['lamp']['webadmin'] = 'webadmin'

default['lamp']['database_root_pass'] = 'root'
default['lamp']['database_conf_vars'] = {
  'mysqld' => {
    'max_allowed_packet' => '64M'
  }
}

default['lamp']['run_once'] = '/etc/do-not-remove'

default['lamp']['remoteuser'] = true

