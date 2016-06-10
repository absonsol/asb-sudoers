
_osfamily               = fact('osfamily')
_operatingsystem        = fact('operatingsystem')
_operatingsystemrelease = fact('operatingsystemrelease').to_f

case _osfamily
when 'RedHat'
  $packagename = 'sudo'
when 'Debian'
  $packagename = 'sudo'
else
  $packagename = '-_-'
end
