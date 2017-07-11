# puppet2sitepp @sudos
define sudoers::sudo(
                      $ensure          = 'present',
                      $order           = '10',
                      $username        = $name,
                      $from            = 'ALL',
                      $users           = 'ALL',
                      $command         = 'ALL',
                      $withoutpassword = false,
                    ) {

  file { "/etc/sudoers.d/${order}_10_sudo_${name}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => inline_template("<%= @username %> <%= @from %>=(<%= @users %>) <% if @withoutpassword %>NOPASSWD: <% end %><%= @command %>\n"),
    require => File['/etc/sudoers.d'],
  }
}
