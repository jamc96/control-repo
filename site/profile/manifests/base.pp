class profile::base {
  # modules
  # test emvironment
  $servers = $facts['env'] ? {
    'production' => ['torntp.sandals.com','vanntp.sandals.com'],
    default => ['vanntp.sandals.com','torntp.sandals.com'],
  }
  # add class
  class { '::ntp':
    servers => $servers,
  }
}

