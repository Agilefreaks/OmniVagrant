class omni::web (
    $user = 'vagrant',
    $ruby_version = 'ruby-2.1.2',
    $gemset = 'webomni'
  ) {
  exec { 'web: install gems':
    command => "cd /vagrant/WebOmni && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle install'",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }->
  exec { 'web: run':
    command => "cd /vagrant/WebOmni && /bin/bash --login -c 'rvm use $ruby_version@$gemset do rails s' &",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }
}
