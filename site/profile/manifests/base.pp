class profile::base {
  # modules
  class { '::ntp':
    servers => ['torntp.sandals.com','vanntp.sandals.com'],
  }
}

