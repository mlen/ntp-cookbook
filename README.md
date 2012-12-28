# NTP server cookbook for Chef

Configures NTP server for a node.

## Configuration

By default this cookbook uses Debian time servers.
The default time zone used in this cookbook is CET.

    default['ntp'] = {
      'servers'  => 4.times.map {|i| "#{i}.debian.pool.ntp.org" },
      'timezone' => "Europe/Warsaw"
    }

