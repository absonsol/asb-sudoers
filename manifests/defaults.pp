define sudoers::defaults(
                          $username     = undef,
                          $order        = '10',
                          $default_name = $name,
                        ) {

  # Defaults:nrpe !requiretty
  file { "/etc/sudoers.d/${order}_defaults_${default_name}_${username}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => inline_template('Defaults<% if defined?(@username) %>:<%= @username %><% end %> <%= @default_name %>\n'),
    require => File['/etc/sudoers.d'],
  }
}
