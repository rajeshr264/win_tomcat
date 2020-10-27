# win_tomcat::service
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include win_tomcat::service
class win_tomcat::service {
  include win_tomcat  
  
  # "choco install tomcat", also registers a service with the name "Tomcat9"
  service { "${win_tomcat::service_name}":
     ensure   => running,
     enable => true,
  }
}
