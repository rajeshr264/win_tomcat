# win_tomcat::install
#
# This class installs Tomcat.  To specify a version change the values
# in the {modulepath}/data/common.yaml.  If version 7 or 9 it tells chocolatey
# to install with the whole version number otherwise it defaults to 'latest' version 8.
#
#
# @example
#   include win_tomcat::install
class win_tomcat::install {
  
  package { 'tomcat':
    ensure          => $win_tomcat::ensure,
    provider        => chocolatey,
    install_options => ['--version', "${win_tomcat::version}", '-y', '-params', '"', "unzipLocation=${win_tomcat::catalina_base}", '"'],
  }
  
  package { 'jdk8':
    ensure          => $win_tomcat::ensure,
    provider        => chocolatey,
  }
  windows_env { "CATALINA_BASE=${win_tomcat::catalina_base}": }
  windows_env { "CATALINA_HOME=${win_tomcat::catalina_home}": }
  
  # install the service if it is not running
  exec { 'tomcat_service_bat':
     command   => "${win_tomcat::catalina_base}\\bin\\service.bat install",
     onlyif    => "get-service -Name ${win_tomcat::version}|%{if ($_.Status -ne 'Running') {exit 0}}",
     provider  => powershell,
  }
}
