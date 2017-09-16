# win_tomcat::config
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include win_tomcat::config
class win_tomcat::config {
  include win_tomcat
  file { $win_tomcat::conffile:
    ensure  => file,
    content => epp('win_tomcat/catalina.properties.epp'),
    #basic template file that comes with default install.
    #Customization is coming soon
  }
}
