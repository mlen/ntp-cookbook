defaults = node['ntp']

package 'ntp'

template '/etc/ntp.conf' do
  owner 'root'
  group 'root'
  mode  '0644'

  source 'ntp.conf.erb'
  variables :servers => defaults['servers']
  notifies :restart, 'service[ntp]'
end

service 'ntp' do
  supports :restart => true, :status => true
  action [:enable, :start]
end

execute 'rebuild_tzdata' do
  command 'dpkg-reconfigure -f noninteractive tzdata'

  action :nothing
end

template '/etc/timezone' do
  owner 'root'
  group 'root'
  mode  '0644'

  source 'timezone.erb'
  variables :timezone => defaults['timezone']
  notifies :run, 'execute[rebuild_tzdata]'
end

