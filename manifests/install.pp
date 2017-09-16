# win_tomcat::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include win_tomcat::install
class win_tomcat::install {
  # Include main class to use its parameters
  include win_tomcat
  package { 'tomcat':
    ensure   => $win_tomcat::version, # Will install the default, otherwise specify version
    provider => chocolatey,
    
    install_options => ['--params', '"', "/installLocation:${$win_tomcat::install_location}", '"'],
  }
}
