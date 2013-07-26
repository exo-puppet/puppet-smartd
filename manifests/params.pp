# == Class: smartd::params
#
# Provides parameters for the smartd module
#
# === Authors
#
# MIT Computer Science & Artificial Intelligence Laboratory
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright 2012 Massachusetts Institute of Technology
# Copyright (C) 2013 Joshua Hoblitt
#

class smartd::params {
  $autoupdate         = false
  $package_name       = 'smartmontools'
  $devicescan         = true
  $devicescan_options = false
  $devices            = [
    ]
  $device_opts        = {
  }
  $mail_to            = 'root'
  $warning_schedule   = 'daily' # other choices: once, diminishing
  $enable_monit       = false

  case $::osfamily {
    'FreeBSD' : {
      $config_file  = '/usr/local/etc/smartd.conf'
      $service_name = 'smartd'
    }
    'RedHat'  : {
      $config_file  = '/etc/smartd.conf'
      $service_name = 'smartd'
    }
    'Debian'  : {
      $config_file  = '/etc/smartd.conf'
      $service_name = 'smartmontools'
    }
    default   : {
      fail("smartd: unsupported OS family ${::osfamily}}")
    }
  }
}
