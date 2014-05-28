class omni::api (
    $user = 'vagrant',
    $ruby_version = 'ruby-2.1.2',
    $gemset = 'omniapi'
  ) {
  vcsrepo { "/home/$user/omniapi":
    ensure => latest,
    provider => git,
    require => [ Package[ 'git' ] ],
    source => 'git@github.com:Agilefreaks/OmniApi.git',
    revision => 'master',
    identity => "/home/$user/.ssh/id_rsa"
  }->
  exec { 'api: install gems':
    command => "cd omniapi && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle install'",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }->
  exec { 'api: run':
    command => "cd omniapi && /bin/bash --login -c 'rvm use $ruby_version@$gemset do bundle exec rackup' &",
    provider => shell,
    user => $user,
    environment => ["HOME=/home/$user"]
  }
}
