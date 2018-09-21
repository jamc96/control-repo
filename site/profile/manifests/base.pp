class profile::base {
  # modules
  include ::ntp
  include ::rsyslog
  include ::rsyslog::client
}

