Vagrant.configure(2) do |config|
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.box = "lucid64"
  config.vm.hostname = 'made-lucid'

  config.vm.network 'forwarded_port', guest: 80, host: 8000
  config.vm.network 'forwarded_port', guest: 443, host: 4430
  config.vm.network 'forwarded_port', guest: 5000, host: 5000
  config.vm.network 'forwarded_port', guest: 5001, host: 5001

  config.vm.network 'private_network', ip: '192.168.0.100'

  config.vm.synced_folder 'www/', '/var/www/', type: :nfs

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
    v.name = 'made-dev-lucid64'
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path = ["roles"]

    chef.add_recipe "apt"
    chef.add_recipe "apt::update_cache"

    chef.add_role "apache-webserver"
    chef.add_role "mysql"
    chef.add_role "php"
    chef.add_role "ruby"
    chef.add_role "python"
    chef.add_role "source-control"
    chef.add_role "development"
    chef.add_role "imagemagick"
    chef.add_role "test"

    chef.json = {
      :phpmyadmin => {
        :hostname => 'phpmyadmin.lucid.local'
      }
    }
  end
end
