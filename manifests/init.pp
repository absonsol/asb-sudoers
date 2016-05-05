#
class sudoers ($overwrite_sudoers=true) inherits sudoers::params {

  if defined(Class['ntteam'])
  {
    ntteam::tag{ 'sudoers': }
  }

  if ($overwrite_sudoers)
  {
    file { '/etc/sudoers':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      content => template("${module_name}/sudoers.erb"),
    }

    file { '/etc/sudoers.d':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

  }


}
