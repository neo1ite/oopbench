#!/usr/bin/env perl

# Benchmark the performance of various packages that implement support for OOP
# in Perl.

use 5.020;
use common::sense;
use Benchmark qw(:all);

use workload;
use oop::vanilla;
use oop::vanilla_sig;
use oop::moo;
use oop::moo_sig;
use oop::mouse;
use oop::mouse_sig;
use oop::moose;
use oop::moose_sig;
use oop::moosex;
use oop::moosex_sig;
use oop::moops;
use oop::moops_moose;

my $procedural;
my $vanilla;
my $vanilla_sig;
my $moo;
my $moo_sig;
my $mouse;
my $mouse_sig;
my $moose;
my $moose_sig;
my $moosex;
my $moosex_sig;
my $moops;
my $moops_moose;
my $prop;

my %new_tests = (
    vanilla     => sub { $vanilla     = oop::vanilla    ->new(name => 'vanilla')     },
    vanilla_sig => sub { $vanilla_sig = oop::vanilla_sig->new(name => 'vanilla_sig') },
    moo         => sub { $moo         = oop::moo        ->new(name => 'moo')         },
    moo_sig     => sub { $moo_sig     = oop::moo_sig    ->new(name => 'moo_sig')     },
    mouse       => sub { $mouse       = oop::mouse      ->new(name => 'mouse')       },
    mouse_sig   => sub { $mouse_sig   = oop::mouse_sig  ->new(name => 'mouse_sig')   },
    moose       => sub { $moose       = oop::moose      ->new(name => 'moose')       },
    moose_sig   => sub { $moose_sig   = oop::moose_sig  ->new(name => 'moose_sig')   },
    moosex      => sub { $moosex      = oop::moosex     ->new(name => 'moosex')      },
    moosex_sig  => sub { $moosex_sig  = oop::moosex_sig ->new(name => 'moosex_sig')  },
    moops       => sub { $moops       = oop::moops      ->new(name => 'moops')       },
    moops_moose => sub { $moops_moose = oop::moops_moose->new(name => 'moops_moose') }
);

my %call_tests = (
    vanilla     => sub { $vanilla    ->run() },
    vanilla_sig => sub { $vanilla_sig->run() },
    moo         => sub { $moo        ->run() },
    moo_sig     => sub { $moo_sig    ->run() },
    mouse       => sub { $mouse      ->run() },
    mouse_sig   => sub { $mouse_sig  ->run() },
    moose       => sub { $moose      ->run() },
    moose_sig   => sub { $moose_sig  ->run() },
    moosex      => sub { $moosex     ->run() },
    moosex_sig  => sub { $moosex_sig ->run() },
    moops       => sub { $moops      ->run() },
    moops_moose => sub { $moops_moose->run() },
    direct      => sub { workload    ->run() }
);

my %call_tests_arg1 = (
    vanilla     => sub { $vanilla    ->run_arg1(5) },
    vanilla_sig => sub { $vanilla_sig->run_arg1(5) },
    moo         => sub { $moo        ->run_arg1(5) },
    moo_sig     => sub { $moo_sig    ->run_arg1(5) },
    mouse       => sub { $mouse      ->run_arg1(5) },
    mouse_sig   => sub { $mouse_sig  ->run_arg1(5) },
    moose       => sub { $moose      ->run_arg1(5) },
    moose_sig   => sub { $moose_sig  ->run_arg1(5) },
    moosex      => sub { $moosex     ->run_arg1(5) },
    moosex_sig  => sub { $moosex_sig ->run_arg1(5) },
    moops       => sub { $moops      ->run_arg1(5) },
    moops_moose => sub { $moops_moose->run_arg1(5) },
    direct      => sub { workload    ->run_arg1(5) }
);

my %prop_tests = (
    vanilla     => sub { $prop = scalar $vanilla    ->result   },
    vanilla_sig => sub { $prop = scalar $vanilla_sig->result   },
    moo         => sub { $prop = scalar $moo        ->result   },
    moo_sig     => sub { $prop = scalar $moo_sig    ->result   },
    mouse       => sub { $prop = scalar $mouse      ->result   },
    mouse_sig   => sub { $prop = scalar $mouse_sig  ->result   },
    moose       => sub { $prop = scalar $moose      ->result   },
    moose_sig   => sub { $prop = scalar $moose_sig  ->result   },
    moosex      => sub { $prop = scalar $moosex     ->result   },
    moosex_sig  => sub { $prop = scalar $moosex_sig ->result   },
    moops       => sub { $prop = scalar $moops      ->result   },
    moops_moose => sub { $prop = scalar $moops_moose->result   },
    direct      => sub { $prop = scalar $vanilla    ->{result} }
);

say "testing new...";
cmpthese(0, \%new_tests);

say "\ntesting method call...";
cmpthese(0, \%call_tests);

say "\ntesting method call with one arg...";
cmpthese(0, \%call_tests_arg1);

say "\ntesting properties...";
cmpthese(0, \%prop_tests);
