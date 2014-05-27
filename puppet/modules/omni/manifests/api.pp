class omni::api {
  vcsrepo { "code/omniapi":
    ensure => latest,
    provider => git,
    require => [ Package[ 'git' ] ],
    source => 'git@github.com:Agilefreaks/OmniApi.git',
    revision => 'master'
  }
}