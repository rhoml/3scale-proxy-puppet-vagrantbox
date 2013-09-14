Vagrant Box for 3scale proxy
============================

## Gathering 3scale proxy config files

You can follow the instructions on the support page at 3scale's support [website](https://support.3scale.net/howtos/api-configuration/nginx-proxy).
## Updating Nginx proxy configurations

After gathering 3scale's configuration, you will download a **proxy_conf.zip** file which you should unzip on the nginx files directory.

## USAGE

````
  git clone git@github.com:rhoml/3scale-proxy-puppet-vagrantbox.git
  cd 3scale-vagrant/modules/nginx/files
  unzip /path/to/proxy_conf.zip
  vagrant up
````

## Author

Rhommel Lamas
1. Twitter: @rhoml
2. Email: roml [at] rhommell.com

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
