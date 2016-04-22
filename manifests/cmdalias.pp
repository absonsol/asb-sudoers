define sudoers::cmdalias(
  				                $order="10",
                          $cmdname=$name,
                          $command,
                        ) {
  #TODO: refer per tindre dependencies automatiques

  validate_re($cmdname, '[A-Z]([A-Z][0-9]_)*')

  file { "/etc/sudoers.d/${order}_00_cmdalias_${cmdname}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => "Cmnd_Alias ${cmdname} =  ${command}\n",
    require => File['/etc/sudoers.d'],
  }

}
