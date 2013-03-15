#!/usr/bin/perl

$virtual_env = $ARGV[0];
$current_dir = $ARGV[1];

if($current_dir =~ /^${virtual_env}/) {
  print "current_dir: ${current_dir} virtual_env: ${virtual_env}: true";
}
else {
  print "current_dir: ${current_dir} virtual_env: ${virtual_env}: false";
}
