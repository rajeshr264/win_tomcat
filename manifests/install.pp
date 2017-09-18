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
  if $win_tomcat::version != undef {
    case $version {
      '/7.\d.\d\d': {
        package { 'tomcat':
          ensure          => $win_tomcat::ensure,
          provider        => chocolatey,
          install_options => ['-params', '--version', "${win_tomcat::version}", '"', "unzipLocation=${$win_tomcat::install_location}", '"'],
        }
      }
      '/8.\d.\d\d': {
        package { 'tomcat':
          ensure          => $win_tomcat::ensure,
          provider        => chocolatey,
          install_options => ['-params', '"', "unzipLocation=${$win_tomcat::install_location}", '"'],
        }
      }
      '9.0.0-rc': {
        package { 'tomcat':
          ensure          => $win_tomcat::ensure,
          provider        => chocolatey,
          install_options => ['-params', '--version', "${win_tomcat::version}", '"', "unzipLocation=${$win_tomcat::install_location}", '"'],
      }
    }
      default: {
        package { 'tomcat':
          ensure => installed,
        }
      }
    }
}