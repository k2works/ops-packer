%w{
  nodejs
  sqlite3
  libmysqlclient-dev
  libsqlite3-dev
  libxslt-dev
  libxml2-dev
  imagemagick
  ruby-dev
}.each do |package|
  package "#{package}" do
    action :install
  end
end
