# = Class to manage nginx as a service
class nginx::service inherits nginx::params {
  service {
    'nginx':
      ensure     => 'running',
      enable     => true,
      pattern    => 'nginx',
      hasstatus  => true,
      hasrestart => true,
      require    => [ File["${nginx::params::openresty_path}/nginx/conf/nginx.conf"], File["${nginx::params::openresty_path}/nginx/conf/nginx_${nginx::params::provider_id}.lua"], File['/etc/init.d/nginx'] ]
  }
}
