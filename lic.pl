#!/usr/bin/env perl
use strict;
use warnings;
use File::Spec;
use File::Basename;

my $VERSION = "0.1";

sub usage {
    print "Usage: lic <license> [OPTIONS] ... [KEY=VALUE] ...\n";
    print "See 'lic --help' for more information.\n";
}

sub help {
    print "Usage: lic <license> [OPTIONS] ... [KEY=VALUE] ...\n";
    print "\nGenerate license text from templates.\n";
    print "\n<license> may be either:\n";
    print "  a path to a license template file, or\n";
    print "  the name of a template in a standard location\n";
    print "\nStandard locations include:\n";
    print "  directories listed in \$LICPATH (colon-separated)\n";
    print "  ~/.local/share/lic\n";
    print "  /usr/share/lic\n";
    print "\nOptions may include:\n";
    print "  -H, --head: use header variant of <license>\n";
    print "\nEach KEY=VALUE replaces all occurrences of {{KEY}} with VALUE in the template.\n";
    print "Whitespace inside {{ }} is ignored.\n";
    print "\nOuput is written to standard output.\n";
}

sub version {
    print "lic version $VERSION\n";
    print "License: BSD 2-Clause\n";
}

my $license;
my $opt_head = 0;
my $opt_vars = 0;
my @substs = ();
my $file;

for my $arg (@ARGV) {
    if ($arg eq "-h" || $arg eq "--help") {
        help;
        exit;
    } 
    elsif ($arg eq "-V" || $arg eq "--version") {
        version;
        exit;
    }
    elsif ($arg eq "-H" || $arg eq "--head") {
        $opt_head = 1;
    }
    elsif ($arg eq "-v" || $arg eq "--vars") {
        $opt_vars = 1;
    }
    elsif (!defined $license) {
        $license = $arg;
    }
    elsif ($arg =~ /([^=]+)=([^=]+)/) {
        push @substs, [$1, $2];
    }
}

unless (defined $license) {
    usage;
    exit;
}

# license headers use .head extension
if ($opt_head == 1) {
    $license .= ".head";
}

if (-f $license) {
    $file = $license;
} 
else {
    my @search_dirs;

    if (defined $ENV{LICPATH}) {
        push @search_dirs, split /:/, $ENV{LICPATH};
    }

    push @search_dirs,
        File::Spec->catdir($ENV{HOME}, ".local", "share", "lic")
            if defined $ENV{HOME};

    push @search_dirs, "/usr/share/lic";

    for my $dir (@search_dirs) {
        my $candidate = File::Spec->catfile($dir, $license);
        if (-f $candidate) {
            $file = $candidate;
            last;
        }
    }

    die "license template $license not found in:\n "
        . join("\n ", @search_dirs) . "\n"
            unless defined $file;
}

open my $input, '<', $file or die "can't open file $file: $!\n";

while (<$input>) {
    chomp;
    my $line = $_;

    if ($opt_vars == 1) {
        for my $key ($line =~ /\{\{\s*([^}]+)\s*\}\}/g) {
            print $key, "\n";
        }
        next;
    }

    foreach my $subst (@substs) {
        my ($key, $val) = @$subst;
        $line =~ s/\{\{\s*\Q$key\E\s*\}\}/$val/g;
    }

    print $line, "\n";
}

close $input or die "can't close file $file: $!\n";

