# win_tomcat::webapps
#
# Deploy Tomcat applications from this class
#
# @summary Deploy your WAR files here.
#
# @example
#   include win_tomcat::webapps
class win_tomcat::webapps {
  # Sample Web Application, using Hiera data for param and value
  # Double slashes for Windows path
  file { "${win_tomcat::catalina_home}\\webapps\\sample.war":
    ensure => file,
    source => $win_tomcat::sample_app_src,
  }
  # Sample Web Application, using a direct URL
  file { "${win_tomcat::catalina_home}\\webapps\\howl-logger":
    ensure => file,
    source => 'https://repo1.maven.org/maven2/howl/howl-logger/0.1.11/howl-logger-0.1.11.jar',
  }
}
