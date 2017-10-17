# prtg
[![Puppet Forge](https://img.shields.io/puppetforge/v/mrwulf/prtg.svg?style=flat-square)](https://forge.puppet.com/mrwulf/prtg)

#### Table of Contents

1. [Overview](#overview)
5. [Usage](#usage)
6. [Development & Contributing](#development)

## Overview
Currently this module just creates a definedd type called 'prtg::sshscript' to enable easy distribution of the ssh scripts that the PRTG *SSH Script Sensor* and *SSH Script Advanced Sensor* run against.

## Usage
First, put the script into `<Module>/files`. For this example, the script is called `sensor_script.sh`.

```puppet
prtg::sshscript{ 'sensor_name':
  script_source => 'puppet:///modules/<Module>/sensor_script.sh',
  script_output   => 'xml',
}
```

### Parameters

#### script_source
Specify a file or template to be the source of the script. It works the same as the file resource's source parameter.

#### script_contents
Specify the source of the script as a string. It works the same as the file resource's content parameter.

#### script_output
Document the type of output from the script. Options are 'xml', 'json', or 'text'. The default is *text*. If you are using the *Advanced* sensor type you should choose between 'xml' and 'json'.

## Development
Submit pull requests against [https://github.com/mrwulf/puppet-prtg].
