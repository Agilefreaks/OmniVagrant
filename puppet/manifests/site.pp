package { "vim":
  ensure => latest
}

node 'dev' {
  class { 'omni::dev': }
}
