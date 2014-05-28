class omni::sync (
    $user = 'vagrant',
    $ruby_version = 'ruby-2.1.2',
    $gemset = 'omnisync'
  ) {
  vcsrepo { "/home/$user/omnisync":
    ensure => latest,
    provider => git,
    require => [ Package[ 'git' ] ],
    source => 'git@github.com:Agilefreaks/OmniSync.git',
    revision => 'master',
    identity => '/home/$user/.ssh/id_rsa'
  }->
  exec { 'sync: install gems':
    command => "cd omniapi && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle install'",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }->
  exec { 'sync: run':
    command => "cd omniapi && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle exec puma -p 9293' &",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }
}
