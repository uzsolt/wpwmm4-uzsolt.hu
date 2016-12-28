#!/usr/bin/env perl

use utf8;
use Encode qw(encode_utf8);
use strict;
use Text::CSV;

my $csv = Text::CSV->new({binary=>1});

my $cl_pdficon  = "pdf_icon";
my $cl_descr    = "stuff_descr";
my $cl_tooltip  = "tooltip_bottom";

sub pdfhref {
  my $pdfpath = shift;
  my $pdffile = shift;
  my $pdfdesc = shift;
  my $pdfhint = shift;

  print "  <a href=\"$pdfpath/$pdffile\"><div class=\"stuff\">\n";
  print "    <div class=\"$cl_pdficon\"></div>\n";
  print "    <div class=\"$cl_descr\">\n";
  print "      $pdfdesc\n";
  print "      <span class=\"$cl_tooltip\">$pdfhint</span>\n";
  print "    </div>\n";
  print "  </div></a>\n";
}

my $file = "data/" . $ARGV[0] . ".csv";
open(my $data, '<', $file) or die "Could not open $file\n";

my $path = $ARGV[0];
$path =~ s/^\/[^\/]*//;
$path = "/static/stuff$path";

# We will skip the first (header) line in CSV.
my $line = <$data>;
print "<div class='stuff_list'>\n";
while (my $line = <$data>) {
  chomp $line;

  if ($csv->parse(encode_utf8($line))) {
    my @fields = $csv->fields();
    pdfhref($path,@fields[1],@fields[0],@fields[2]);
  } else {
    warn "Could not parse!\n";
  }
}
print "</div>\n";
