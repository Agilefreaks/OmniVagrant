class omni::ruby (
    $gemset = 'omni',
    $user = 'vagrant',
    $rvm_version = '1.25.26',
    $ruby_version = '2.1.2'    
  ) {
  class { 'rvm':
    version => $rvm_version
  }->
  file { '/etc/rvmrc':
    content => "umask u=rwx,g=rwx,o=rx\nrvm_trust_rvmrcs_flag=1\n",
    require => Class['rvm']
  }->
  rvm_system_ruby { $ruby_version:
    ensure      => present,
    default_use => true
  }->
  rvm_gem { "$ruby_version/puppet":
    ensure  => latest
  }->
  rvm_gemset { "$ruby_version@$gemset":
    ensure  => present
  }->
  rvm::system_user { "$user": }
}
