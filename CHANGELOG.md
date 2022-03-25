# CHANGELOG

## 0.1.36

**INCOMPATBLE CHANGE
* Added @use_pty as default to meet CaaS
* Added @sudo_logs to meet CaaS

## 0.1.35

* added support for Debian 8, 9 and 10

## 0.1.34

* added sudo configtest on refresh

## 0.1.33

* added support for **Ubuntu 20.04**
* added mode options to configure global default options
  - lecture / lecture_file
  - badpass_message
  - passwd_timeout
  - passwd_tries
  - insults

## 0.1.32

* modified **sudoers::sudo**:
  - description option
  - allow users variable to be an array

## 0.1.31

* improved regex for sudoers.d files

## 0.1.30

* bugfix: sudo files cannot contain dots:
  ```
  sudo will read each file in /etc/sudoers.d, skipping file names that end in ‘~’ or contain a ‘.’ character to avoid causing problems with package manager or editor temporary/backup files.  Files are
  parsed in sorted lexical order.  That is, /etc/sudoers.d/01_first will be parsed before /etc/sudoers.d/10_second.  Be aware that because the sorting is lexical, not numeric, /etc/sudoers.d/1_whoops
  would be loaded after /etc/sudoers.d/10_second.  Using a consistent number of leading zeroes in the file names can be used to avoid such problems.
  ```

## 0.1.29

* added support for **RHEL 8**

## 0.1.28

* added support for **SLES 12.4**

## 0.1.27

* added support for **SLES 12.3**

## 0.1.26

* dropped deprecated dependencies

## 0.1.25

* improved dependencies

## 0.1.24

* added support for **Ubuntu 18.04**

## 0.1.23

* added ensure for **sudoers::sudo**

## 0.1.22

* added **sudo_timeout** (timestamp_timeout)

## 0.1.21

* added support for **SLES11SP3**

## 0.1.20

* bugfix

## 0.1.19

* added sudoers::defaults
