class omni::mongo {
  class { 'mongodb::globals':
    manage_package_repo => true,
  }->
  class { 'mongodb::server': 
    bind_ip => ['127.0.0.1',"$ipaddress_eth0"]
  }->
  class { 'mongodb::client': }
}
