# win_tomcat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include win_tomcat
class win_tomcat (
  $conffile,
  $version,
  $install_location,
  $ensure,
) {
  include win_tomcat::install
  include win_tomcat::config
  include win_tomcat::service
  include win_tomcat::sites
  include win_tomcat::applications

  Class['win_tomcat::install']
  -> Class['win_tomcat::config']
  ~> Class['win_tomcat::service'] # the ~> "notifies" the service when a change happens.
}
