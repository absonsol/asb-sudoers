# puppet2sitepp @sudoersdefaults
define sudoers::defaults(
                          $username     = undef,
                          $order        = '10',
                          $default_name = $name,
                        ) {

  include ::sudoers

  $username_cleanup = regsubst($username, '[^a-zA-Z0-9]+', '_', 'G')
  $defaults_cleanup = regsubst($default_name, '[^a-zA-Z0-9]+', '_', 'G')

  # Defaults:nrpe !requiretty
  file { "/etc/sudoers.d/${order}_defaults_${defaults_cleanup}_${username_cleanup}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => template("${module_name}/defaults.erb"),
    require => Class['::sudoers'],
  }
}
