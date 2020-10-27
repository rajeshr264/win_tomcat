# win_tomcat::service
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include win_tomcat::service
class win_tomcat::service {
    
  exec { 'tomcat_start_bat':
     command   => "${win_tomcat::catalina_base}\\bin\\start.bat",
  }
}
