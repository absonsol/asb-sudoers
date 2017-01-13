# sudoers

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What sudoers affects](#what-sudoers-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sudoers](#beginning-with-sudoers)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [Contributing](#contributing)

## Overview

Manage sudoers

## Module Description

This module needs **/etc/sudoers.d** support, which is true for:
* RedHat 6 and up
* Ubuntu 10.04 and up.

## Setup

### What sudoers affects

* Unless overwrite_sudoers is false, **/etc/sudoers**
* Creates / deletes files on **/etc/sudoers.d**

### Setup Requirements

This module requires pluginsync enabled

### Beginning with sudoers

basic example:

```puppet
class { 'sudoers': }

sudoers::sudo { 'vagrant':
  withoutpassword => true,
}
```

## Usage

Add users with full sudo access:

```hiera
sudos:
  adminuser:
    withoutpassword: true
  cpiscina: {}
  mlleidebrad: {}
  mtelevisio: {}
```

Restrict sudo to a specific command:

```hiera
sudos:
  ppt-deploy:
    command: /etc/init.d/nginx
  ppt-deploy-service:
    username: bbt-deploy
    command: /usr/bin/service
```

sudoers::defaults:

```puppet
sudoers::defaults { '!requiretty':
  username => 'nrpe',
}
```

```

```
## Reference

### classes

#### sudoers

* **overwrite_sudoers**: (default: true)
* **visiblepw**: (default: false)
* **requiretty**: (default: false)
* **manage_package**: (default: true)
* **package_ensure**: (default: installed)
* **sudoersd_recurse**: (default: true)
* **sudoersd_purge**: (default: true)

### defines

#### cmdalias

* **cmdname** (default: resource's name)
* **order** (default: 10)
* **command**

#### useralias

* **useraliasname** (default: resource's name)
* **order** (default: 10)
* **users**

#### sudo

* **username** (default: resource's name)
* **order** (default: 10)
* **from** (default: ALL)
* **users** (default: ALL)
* **command** (default: ALL)
* **withoutpassword** (default: false)

## Limitations

Tested on:
* CentOS 6
* CentOS 7
* Ubuntu 14.04

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
