#!/usr/bin/perl

$virtual_env = $ARGV[0];
$current_dir = $ARGV[1];

if($current_dir =~ /^${virtual_env}/) {
  print "true";
}
else {
  print "false";
}
