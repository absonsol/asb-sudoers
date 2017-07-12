# puppet2sitepp @sudoersuseraliases
define sudoers::useralias(
                            $users,
                            $order         ='10',
                            $useraliasname = $name,
                          ) {
  #TODO: refer per tindre dependencies automatiques

  validate_array($users)

  #NAME ::= [A-Z]([A-Z][0-9]_)*
  validate_re($useraliasname, '[A-Z]([A-Z][0-9]_)*')

  file { "/etc/sudoers.d/${order}_00_useralias_${useraliasname}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => inline_template("User_Alias <%= @useraliasname %> = <%= @users.join(',') %>\n"),
    require => File['/etc/sudoers.d'],
  }

}
