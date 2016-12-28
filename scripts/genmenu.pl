#!/usr/bin/env perl

use utf8;
use Encode qw(encode_utf8);
use strict;
use JSON;

open(f,"data/menu.json") or die "Can't read this file: $!\n";
my $json_string = join '', <f>;
$json_string = encode_utf8($json_string);
my $json_data = decode_json $json_string;

my @ret=split(/\//,@ARGV[0]);

sub printmenu {
  my $mydata = shift;
  my $level = shift;
  my $myurl = shift;

  $level = ($level)?$level:0;
  $myurl = ($myurl)?$myurl:"";

  my $indent = "  " x ($level+1);

  my $inactive = ( ($level==0)?"menu":"submenu" );
  print $indent . "<div class=div_$inactive>";
  foreach my $a (@{$mydata}) {
    print $indent . "_DIV(";
      print ( ($a->{href} eq @ret[$level+1])?"selected":"$inactive" );
      print ",\n" . $indent .
        "`_HREF(`" . (($level==0)?"/":""). $myurl . $a->{href} . "',`" . 
        $a->{title} . "',`class=menu_href',`" . 
        $a->{tooltip} . "')'";
      if ($a->{href} eq @ret[$level+1]) {
        if ($a->{submenu}) {
          print "`";
          print "\n";
          #print $indent . "<div class=div_submenu>\n";
          printmenu($a->{submenu},$level+1,(($level==0)?"/":"").$myurl.$a->{href}."/");
          #print "\n" . $indent . "</div>";
          print "'";
        }
      }
    print "\n" . $indent . ")\n";
  }
  print $indent . "</div>";
}

print "<div id=menu>\n";
print "  <a href=http://uzsolt.hu>\n";
print "  <div id=menu_header><h2>Udvari Zsolt honlapja</h2></div>\n";
print "  </a>";
print "\n";
printmenu(\@{$json_data});
print "</div>\n";

