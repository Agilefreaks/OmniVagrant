class omni::web (
    $user = 'vagrant',
    $ruby_version = 'ruby-2.1.2',
    $gemset = 'webomni'
  ) {
  vcsrepo { "/home/$user/omni/webomni":
    ensure => latest,
    provider => git,
    require => [ Package[ 'git' ] ],
    source => 'git@github.com:Agilefreaks/WebOmni.git',
    revision => 'master',
    identity => "/home/$user/.ssh/id_rsa"
  }->
  exec { 'web: install gems':
    command => "cd omni/webomni && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle install'",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }->
  exec { 'web: run':
    command => "cd omni/webomni && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle exec rails s' &",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }
}
