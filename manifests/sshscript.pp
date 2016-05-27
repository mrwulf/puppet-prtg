# == Class: prtg::customscript
#
# Deploy a custom prtg script.
#
# === Parameters
#
# [*script_outuput*]
#   Specify type of output from the script. Either xml, json, or [text].
#
# [*script_contents*]
#   Script source.
#
# === Examples
#
#  prtg::sshscript { 'customscript':
#    script_output   => 'xml',
#    script_contents => 'puppet:///modules/myprofile/customscript.sh'
#  }
#
# === Authors
#
# Brandon Wulf <brandon@webwulf.net>
#
# === Copyright
#
# Copyright 2016 Brandon Wulf, unless otherwise noted.
#
define prtg::sshscript (
  $script_contents ,
  $script_output    = 'text',
  ) {
  validate_re( $script_output, '^(xml|json|text)$',
    'Invalid $script_output parameter value.')
  if (size($script_contents) == 0) {
    fail('$content must be provided.')
  }

  $base_directory = '/var/prtg'
  if (! defined(File[$base_directory])) {
    file{ $base_directory:
      ensure => 'directory',
      mode   => '0755',
    }
  }

  $scripts_directory = $script_output ? {
    /(xml|json)/ => "${base_directory}/scriptsxml",
    default      => "${base_directory}/scripts"
    }
  if (! defined(File[$scripts_directory])) {
    file{ $scripts_directory:
      ensure => 'directory',
      mode   => '0755',
    }
  }

  $script_filename = "${scripts_directory}/${name}"
  file{ $script_filename:
    ensure  => 'file',
    mode    => '0755',
    content => $script_contents,
  }
}
