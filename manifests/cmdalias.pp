# puppet2sitepp @sudoerscmdalises
define sudoers::cmdalias(
                          $command,
                          $order   = '10',
                          $cmdname = $name,
                        ) {
  #TODO: refer per tindre dependencies automatiques
  include ::sudoers

  $cmdname_cleanup = regsubst($cmdname, '[^a-zA-Z0-9]+', '_', 'G')

  file { "/etc/sudoers.d/${order}_00_cmdalias_${cmdname_cleanup}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => "Cmnd_Alias ${cmdname} =  ${command}\n",
    require => Class['::sudoers'],
  }

}
