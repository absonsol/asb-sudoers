# puppet2sitepp @sudos
# @params ensure Control the existences of this sudo default: present
# @params order sudo order default: 10
# @params username        = $name,
# @params from            = 'ALL',
# @params users           = 'ALL',
# @params command         = 'ALL',
# @params withoutpassword = false,
#
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
