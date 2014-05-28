class omni::dev (
    $gemsetapi = 'omniapi',
    $gemsetweb = 'webomni',
    $gemsetsync = 'omnisync'
  ) {
  class { 'omni::ruby':
    gemsets => [$gemsetapi, $gemsetweb, $gemsetsync]
  }->
  class { 'omni::mongo': }->
  class { 'github': }->
  class { 'omni::api': }->
  class { 'omni::sync': }->
  class { 'omni::web': }
}
