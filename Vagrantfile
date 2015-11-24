unless Vagrant.has_plugin?('vagrant-omnibus')
  raise 'vagrant-omnibus is not installed! Install with `vagrant plugin install vagrant-omnibus`'
end

Vagrant.configure(2) do |config|
  config.vm.box_url = 'https://s3-eu-west-1.amazonaws.com/madetech-vagrant/made-dev-trusty64.box'
  config.vm.box = 'made-dev-trusty64'

  config.vm.hostname = 'made-trusty'

  config.vm.network 'forwarded_port', guest: 80, host: 8000
  config.vm.network 'forwarded_port', guest: 443, host: 4430
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network 'forwarded_port', guest: 5000, host: 5000
  config.vm.network 'forwarded_port', guest: 5001, host: 5001

  config.vm.network 'private_network', ip: '192.168.10.100'

  synced_folder_path = ENV['SYNCED_FOLDER_PATH'] || 'www'
  synced_folder_type = ENV['SYNCED_FOLDER_TYPE'] || 'virtualbox'

  config.vm.synced_folder synced_folder_path, '/var/www/', type: synced_folder_type

  cpus = ENV['VAGRANT_CPUS'] || '2'

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--memory', '2048']
    v.customize ['modifyvm', :id, '--cpus', cpus]
    v.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.omnibus.chef_version = '11.8.2'

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.roles_path = ['roles']

    chef.add_role 'vagrant_dev'
  end
end
