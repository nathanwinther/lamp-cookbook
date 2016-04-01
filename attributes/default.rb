default['firewall']['allow_ssh'] = true

default['lamp']['run_once']['directory'] = '/var/chef/run_once'

default['lamp']['firewall']['ports'] = [80, 443, 3306]

default['lamp']['webadmin']['user'] = 'webadmin'

default['lamp']['web']['ports'] = ['80', '443']
default['lamp']['web']['user'] = 'webadmin'
default['lamp']['web']['group'] = 'webadmin'

default['lamp']['database']['root_password'] = 'root'
default['lamp']['database']['root_remote'] = true
default['lamp']['database']['conf_vars'] = {
  'mysqld' => {
    'max_allowed_packet' => '64M',
  }
}

