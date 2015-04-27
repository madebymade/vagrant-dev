remote_file '/tmp/cf_cli_amd64.deb' do
  source 'http://go-cli.s3-website-us-east-1.amazonaws.com/releases/v6.1.2/cf-cli_amd64.deb'
  mode 0644
end

dpkg_package 'cf' do
  source '/tmp/cf_cli_amd64.deb'
  action :install
end
