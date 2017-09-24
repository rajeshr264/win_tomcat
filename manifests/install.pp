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
  # Include main class to use its parameters
  include win_tomcat
  if $win_tomcat::version_major == '7' or '9' {
    package { 'tomcat':
      ensure          => installed,
      provider        => chocolatey,
      install_options => ['-params', "--version ${win_tomcat::version}", '"', "unzipLocation=${$win_tomcat::install_path}", '"'],
    }
  } else {
    package { 'tomcat':
      ensure          => installed,
      provider        => chocolatey,
      install_options => ['-params', '"', "unzipLocation=${$win_tomcat::install_path}", '"'],
    }
  }
}