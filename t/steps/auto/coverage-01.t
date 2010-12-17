#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto/perldoc-01.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 27;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::coverage');
use Parrot::BuildUtil;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::coverage};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "runstep() completed successfully");
ok(defined($step->result), "Result was defined");

$conf->replenish($serialized);

########## _initial_content_check() ##########

my $content = undef;
my $util = 'gcov';
my $rv = $step->_initial_content_check($conf, $content, $util);
ok(! defined $rv, "Got expected return value when content was undefined");
ok(! $conf->data->get( "has_$util" ),
    "has_$util false as expected when content is empty" );
ok(! $conf->data->get( "TEMP_$util" ),
    "TEMP_$util false as expected when content is empty" );
ok(! $conf->data->get( "TEMP_${util}_build" ),
    "has_$util false as expected when content is empty" );

########### _handle_version() ##########
#
#my $version;
#$version = 0;
#ok(auto::perldoc::_handle_version($conf, $version, 'not_a_path'),
#    "_handle_version() returned true value");
#is($conf->data->get('has_perldoc'), 0,
#    "Got expected value for 'has_perldoc'");
#is($conf->data->get('new_perldoc'), 0,
#    "Got expected value for 'new_perldoc'");
#is($conf->data->get('perldoc'), 'echo',
#    "... and expected 'perldoc' path");
#
#$version = 1;
#ok(auto::perldoc::_handle_version($conf, $version, 'path_to_pd'),
#    "_handle_version() returned true value");
#is($conf->data->get('has_perldoc'), 1,
#    "Got expected value for 'has_perldoc'");
#is($conf->data->get('new_perldoc'), 0,
#    "Got expected value for 'new_perldoc'");
#is($conf->data->get('perldoc'), 'path_to_pd',
#    "... and expected 'perldoc' path");
#
#$version = 2;
#ok(auto::perldoc::_handle_version($conf, $version, 'another_path_to_pd'),
#    "_handle_version() returned true value");
#is($conf->data->get('has_perldoc'), 1,
#    "Got expected value for 'has_perldoc'");
#is($conf->data->get('new_perldoc'), 1,
#    "Got expected value for 'new_perldoc'");
#is($conf->data->get('perldoc'), 'another_path_to_pd',
#    "... and expected 'perldoc' path");
#
########### _handle_old_perldoc() ##########
#
#$version = $step->_handle_old_perldoc();
#is($version, 1, "Got expected version setting for old perldoc");
#is($step->result(), q{yes, old version},
#    "Got expected result when old perldoc");
#
########### _handle_no_perldoc() ##########
#
#$version = $step->_handle_no_perldoc();
#is($version, 0, "Got expected version setting for no perldoc");
#is($step->result(), q{failed}, "Got expected result when no perldoc");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/coverage-01.t - test auto::perldoc

=head1 SYNOPSIS

    % prove t/steps/auto/coverage-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::coverage.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::coverage, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
