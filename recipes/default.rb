package 'ntp'

template '/etc/ntp.conf' do
  owner 'root'
  group 'root'
  mode  '0644'

  source 'ntp.conf.erb'
  variables :servers => node[:ntp][:servers]
  notifies :restart, 'service[ntp]'
end

service 'ntp' do
  supports :restart => true, :status => true
  action [:enable, :start]
end
