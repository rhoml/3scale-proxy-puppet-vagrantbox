# = Class to manage nginx on 3scale proxy
class nginx inherits nginx::params {
  include nginx::dependencies
  include nginx::install
  include nginx::service

  File{
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0644',
  }

  file {
    "${nginx::params::openresty_path}/nginx/conf/nginx.conf":
      ensure  => 'present',
      source  => "puppet:///modules/nginx/proxy_configs/nginx_${provider_id}.conf",
      require => [ User['nginx'], Exec['make-install'] ],
      notify  => Service['nginx']
  }

  file {
    "${nginx::params::openresty_path}/nginx/conf/nginx_${provider_id}.lua":
      ensure => 'present',
      source => "puppet:///modules/nginx/proxy_configs/nginx_${provider_id}.lua",
      require => File["${nginx::params::openresty_path}/nginx/conf/nginx.conf"],
      notify  => Service['nginx']
  }

  file {
    '/etc/init.d/nginx':
      ensure  => 'present',
      mode    => '0755',
      content => template('nginx/nginx-init.erb'),
      notify  => Service['nginx']
  }
}
