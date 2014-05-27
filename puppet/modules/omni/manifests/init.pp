class omni::dev (
    $gemsetapi = 'omniapi',
    $gemsetweb = 'webomni'
  ) {
  class { 'omni::ruby':
    gemset => $gemsetapi
  }
}
