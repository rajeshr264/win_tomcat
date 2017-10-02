# win_tomcat::webapps
#
# Deploy Tomcat applications from this class
#
# @summary Deploy your WAR files here.
#
# @example
#   include win_tomcat::webapps
class win_tomcat::webapps {
  # Sample Web Application being hosted on an external URL
  file { "${win_tomcat::catalina_home}/webapps/sample.war":
    ensure => file,
    source => $win_tomcat::sample_app_src,
  }
}
