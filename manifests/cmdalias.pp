define sudoers::cmdalias(
  				                $order="10",
                          $cmdname=$name,
                          $command,
                        ) {
  #TODO: refer per tindre dependencies automatiques

  file { "/etc/sudoers.d/${order}_00_cmdalias_${cmdname}":
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => "Cmnd_Alias ${cmdname} =  ${command}\n",
    require => File['/etc/sudoers.d'],
  }

}
