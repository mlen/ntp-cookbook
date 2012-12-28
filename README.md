# NTP server cookbook for Chef

Configures NTP server for a node.

## Configuration

By default this cookbook uses Debian time servers.
This can be changed by changing ntp servers variable for a node.

    default['ntp']['servers'] = 4.times.map {|i| "#{i}.debian.pool.ntp.org" }

