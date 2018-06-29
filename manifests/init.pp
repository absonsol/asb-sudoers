#
class sudoers (
                $overwrite_sudoers = true,
                $visiblepw         = false,
                $requiretty        = false,
                $manage_package    = true,
                $package_ensure    = 'installed',
                $sudoersd_recurse  = true,
                $sudoersd_purge    = true,
                $sudo_timeout      = '15',
              ) inherits sudoers::params {

  if($manage_package)
  {
    package { $sudoers::params::packagename:
      ensure => $package_ensure,
      before => File['/etc/sudoers.d'],
    }
  }

  if ($overwrite_sudoers)
  {
    file { '/etc/sudoers':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      content => template("${module_name}/sudoers.erb"),
      before  => File['/etc/sudoers.d'],
    }
  }

  file { '/etc/sudoers.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => $sudoersd_recurse,
    purge   => $sudoersd_purge,
  }
}
