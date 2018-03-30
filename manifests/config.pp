# == Class: telegraf::config
#
# Templated generation of telegraf.conf
#
class telegraf::config inherits telegraf {

  assert_private()

  file {
    $::telegraf::config_dir:
      ensure  => directory,
      owner   => $::telegraf::config_file_owner,
      group   => $::telegraf::config_file_group,
      mode    => '0770',
      notify  => Class['::telegraf::service'],
      require => Class['::telegraf::install'],
    ;
    $::telegraf::config_file:
      ensure  => file,
      content => template('telegraf/telegraf.conf.erb'),
      owner   => $::telegraf::config_file_owner,
      group   => $::telegraf::config_file_group,
      mode    => '0640',
      notify  => Class['::telegraf::service'],
      require => Class['::telegraf::install'],
    ;
  }

}
