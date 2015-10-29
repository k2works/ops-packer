%w{
  libffi-dev
}.each do |package|
  package "#{package}" do
    action :install
  end
end

rbenv_ruby "#{node['ruby']['version']}" do
  ruby_version node['ruby']['version']
  global true
end

rbenv_gem "bundler" do
  ruby_version node['ruby']['version']
end
