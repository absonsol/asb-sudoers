class sudoers::configtest inherits sudoers::params {
  exec { 'asb-sudoers visudo check':
    command => 'visudo -c',
    unless  => 'visudo -c',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
}
