class omni::dev (
    $gemsetapi = 'omniapi',
    $gemsetweb = 'webomni'
  ) {
  class { 'omni::ruby':
    gemsets => [$gemsetapi, $gemsetweb]
  }->
  class { 'omni::mongo': }->
  class { 'omni::api': }
}
