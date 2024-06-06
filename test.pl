#! /usr/bin/perl -w
use strict;
use v5.10;
 
print "Perl version: $^V\n";

$a = "5";

if ($a == " 5 ") { print "Numeric equality!\n"; }
if ($a eq " 5 ") { print "String equality!\n"; }

# Triple a list of numbers
my @tripled;

my @numbers = (1..10);
for my $num (@numbers) {
	push @tripled, $num * 3;
}

my @tripled1 = map { $_ * 3 } @numbers;

 sub reverse_greeting {
        my $name = reverse shift;
        return "Hello, $name!";
    }

    my $name = 'Chuck';
    say reverse_greeting( $name );
    say $name;
