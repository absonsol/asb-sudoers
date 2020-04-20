# puppet2sitepp @sudoersuseraliases
define sudoers::useralias(
                            $users,
                            $order         ='10',
                            $useraliasname = $name,
                          ) {
  #TODO: refer per tindre dependencies automatiques
  include ::sudoers

  #NAME ::= [A-Z]([A-Z][0-9]_)*
  validate_re($useraliasname, '[A-Z]([A-Z][0-9]_)*')

  $useraliasname_cleanup = regsubst($useraliasname, '[^A-Z0-9]+', '_', 'G')

  file { "/etc/sudoers.d/${order}_00_useralias_${useraliasname_cleanup}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => inline_template("User_Alias <%= @useraliasname %> = <%= @users.join(',') %>\n"),
    require => Class['::sudoers'],
    notify  => Class['::sudoers::configtest'],
  }

}
