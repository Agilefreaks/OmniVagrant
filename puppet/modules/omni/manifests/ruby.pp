class omni::ruby (
    $gemsets = ['omni'],
    $user = 'vagrant',
    $ruby_version = '2.1.2'    
  ) {
  rvm::rvmuser { $user:
    installdefaultruby => $ruby_version
  }->
  rvm::creategemset { $gemsets:
    user => $user,
    rubyversion => $ruby_version
  } 
}
