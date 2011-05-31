# Class: mcollective::server::pkg
#
#   This class installs the MCollective server package and all dependencies.
#
# Parameters:
#
#  [*version*]            - The version of the MCollective package(s) to
#                             be installed.
#  [*pkg_provider*]       - The package provider resource to use.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mcollective::server::pkg(
  $version,
  $pkg_provider
) {

  #include 'mcollective::pkg'

  package { 'mcollective':
    ensure	  => $version,
    provider  => $pkg_provider,
  }
  
  case $operatingsystem {
    debian,ubuntu: {
      class { 'mcollective::pkg::debian': }
    }
  }
  
}