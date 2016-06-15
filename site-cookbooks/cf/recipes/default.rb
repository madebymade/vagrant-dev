remote_file '/tmp/cf_cli_amd64.deb' do
  source 'https://cli.run.pivotal.io/stable?release=debian64&version=6.19.0'
  mode 0644
end

dpkg_package 'cf' do
  source '/tmp/cf_cli_amd64.deb'
  action :install
end
