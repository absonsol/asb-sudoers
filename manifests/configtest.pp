class sudoers::configtest inherits sudoers::params {
  exec { 'eyp-sudoers visudo check':
    command     => 'visudo -c',
    refreshonly => true,
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
}
