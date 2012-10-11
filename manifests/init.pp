#
# apache module
#
# Copyright 2010, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class shibboleth {
  package{'shibboleth':
    alias => 'shibboleth',
    ensure => present,
  }
  service{'shibboleth':
    name => 'shibd',
    ensure => running,
    enable => true,
  }
  file{'/etc/shibboleth/SWITCHaaiRootCA.crt.pem':
    source => [
      "puppet://$server/modules/site-shibboleth/config/$fqdn/SWITCHaaiRootCA.crt.pem",
    ],
    require => Package['shibboleth'],
    notify => Service['shibboleth'],
    owner => shibd, group => 0, mode => 0644;
  }
  file{'/etc/shibboleth/sp-cert.pem':
    source => [
      "puppet://$server/modules/site-shibboleth/config/$fqdn/sp-cert.pem",
    ],
    require => Package['shibboleth'],
    notify => Service['shibboleth'],
    owner => shibd, group => 0, mode => 0644;
  }
  file{'/etc/shibboleth/sp-key.pem':
    source => [
      "puppet://$server/modules/site-shibboleth/config/$fqdn/sp-key.pem",
    ],
    require => Package['shibboleth'],
    notify => Service['shibboleth'],
    owner => shibd, group => 0, mode => 0644;
  }
  file{'/etc/shibboleth/shibboleth2.xml':
    source => [
      "puppet://$server/modules/site-shibboleth/config/$fqdn/shibboleth2.xml",
    ],
    require => Package['shibboleth'],
    notify => Service['shibboleth'],
    owner => shibd, group => 0, mode => 0644;
  }
  file{'/etc/shibboleth/attribute-policy.xml':
    source => [
      "puppet://$server/modules/site-shibboleth/config/$fqdn/attribute-policy.xml",
    ],
    require => Package['shibboleth'],
    notify => Service['shibboleth'],
    owner => shibd, group => 0, mode => 0644;
  }
  file{'/etc/shibboleth/attribute-map.xml':
    source => [
      "puppet://$server/modules/site-shibboleth/config/$fqdn/attribute-map.xml",
    ],
    require => Package['shibboleth'],
    notify => Service['shibboleth'],
    owner => shibd, group => 0, mode => 0644;
  }
}
