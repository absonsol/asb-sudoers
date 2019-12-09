# puppet2sitepp @sudos
# @params ensure Control the existences of this sudo
# @params order sudo order
# @params username Made up of one or more user names, user IDs (prefixed with #), system group names and IDs (prefixed with % and %# respectively), netgroups (prefixed with +), non-Unix group names and IDs (prefixed with %: and %:# respectively)
# @params from ALL
# @params users ALL
# @params command ALL
# @params withoutpassword false
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
  include ::sudoers

  $name_cleanup = regsubst($name, '[^a-zA-Z]+', '_')

  file { "/etc/sudoers.d/${order}_10_sudo_${name_cleanup}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => inline_template("<%= @username %> <%= @from %>=(<%= @users %>) <% if @withoutpassword %>NOPASSWD: <% end %><%= @command %>\n"),
    require => Class['::sudoers'],
  }
}
