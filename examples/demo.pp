class { 'sudoers':
  overwrite_sudoers => false,
  sudoersd_recurse  => false,
  sudoersd_purge    => false,
}

sudoers::sudo { 'rekcuf':
  withoutpassword => true,
}
