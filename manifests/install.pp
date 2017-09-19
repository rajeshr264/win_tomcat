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
  if $win_tomcat::major_version and $win_tomcat::minor_version {
    case $win_tomcat::major_version {
      '7': {
        package { 'tomcat':
          ensure          => $win_tomcat::ensure,
          provider        => chocolatey,
          install_options => ['-params', '--version', "${win_tomcat::version}", '"', "unzipLocation=${$win_tomcat::install_path}", '"'],
        }
      }
      '8': {
        package { 'tomcat':
          ensure          => $win_tomcat::ensure,
          provider        => chocolatey,
          install_options => ['-params', '"', "unzipLocation=${$win_tomcat::install_path}", '"'],
        }
      }
      '9': {
        package { 'tomcat':
          ensure          => $win_tomcat::ensure,
          provider        => chocolatey,
          install_options => ['-params', '--version', "${win_tomcat::version}", '"', "unzipLocation=${$win_tomcat::install_path}", '"'],
      }
    }
      default: {
        package { 'tomcat':
          ensure          => installed,
          provider        => chocolatey,
          install_options => ['-params', '"', "unzipLocation=${$win_tomcat::install_path}", '"'],
        }
      }
    }
  }
}