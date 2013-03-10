#!/usr/bin/perl

while($a = <STDIN>) {
  chomp($a);
  print $a . "\n";
  if($a =~ /main = .*:main/) {
    print "      [pyramid.scaffold]\n";
    print "      angular = templates:AngularProjectTemplate\n";
    print "      jade = templates:JadeProjectTemplate\n";
    print "      jade_template = templates:JadeTemplateProjectTemplate\n";
  }
}
